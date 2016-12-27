class VideosController < ApplicationController
  include VideosHelper

  before_action :set_video, only: [:register, :play, :show, :edit, :update, :destroy]


  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    current_user.try :watch_video, @video
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def register
    pDebug('register')
    # from http://codegolf.stackexchange.com/questions/4707/outputting-ordinal-numbers-1st-2nd-3rd
    def o(n)n.to_s+%w{th st nd rd}[n/10%10==1||n%10>3?0:n%10]end

    uv = UserVideo.where( :user_id => current_user.id, :video_id => @video.id)
    if uv.empty?
      uv = UserVideo.new
      uv.user_id    = current_user.id
      uv.video_id   = @video.id
      uv.iterations = 1

      if uv.save
        update_user_badges
        flash[:success] = "Video registered to #{current_user.name} - 1st viewing."
        render :json => { :message => "Video registered to #{current_user.name} - 1st viewing." } 
      else
        pDebug("Register error: #{uv.errors.messages}")
        render :json => { :message => "Couldn't register video to #{current_user.name}; error=#{uv.errors.messages}" } 
      end
    else
      uv[0].iterations += 1
      if uv[0].save
        update_user_badges
        msg = "That was the #{o(uv[0].iterations)} viewing of this video"
        flash[:success] = msg
        render :json => { :message => msg} 
      else
        pDebug("Register error: #{uv.errors.messages}")
        render :json => { :message => "Couldn't register video to #{current_user.name}; error=#{uv.errors.messages}" } 
      end
    end
  end


  def play
    pDebug('play')
    if current_user.nil?
      flash[:danger] = "* Need to be logged in."
      redirect_to videos_path
    else
      @video = @video.decorate(view_context)
      pDebug(@video.inspect)
    end
  end








  private

  
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name)
    end


    def update_user_badges
      pDebug('update_user_badges')
      awarded = ''
      Rule.all.each do |rule|
        UserVideo.where( :user_id => current_user.id ).each do |uv|
          if in_range(uv.iterations, rule)
            awarded = Badge.find_by( :name => rule.badge_name)  

            if UserBadge.where( :badge_id => awarded.id, :user_id => current_user.id).size > 0
              break
            end

            ub = UserBadge.new
            ub.badge_id = awarded.id
            ub.user_id  = current_user.id
            if ub.save
              pDebug("User badge awarded and saved in UserBadge")
            else
              pDebug("Error in saving UserBadge: #{ub.errors.messages}")
            end
            break
          end
        end
      end
    end


    def in_range( iterations, rule )
      if rule.video_name == '*'  
        my_viewings = 0
        UserVideo.where( :user_id => current_user.id ).each do |uv|
          my_viewings += uv.iterations
        end

        if rule.view_count == 0   # view all videos
          return UserVideo.where( :user_id => current_user.id).count >= Video.count
        else
          return my_viewings >= rule.view_count
        end

      else                         
        badge = Badge.find_by( :name => rule.badge_name )
        video = Video.find_by( :name => rule.video_name )

        uv = UserVideo.where( :user_id => current_user.id, :video_id => video.id )
        if uv.empty?
          return false
        else
          return uv[0].iterations == rule.view_count
        end
      end
    end


end
