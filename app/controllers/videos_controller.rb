class VideosController < ApplicationController
  before_action :set_video, only: [:register, :play, :show, :edit, :update, :destroy]


  def play
    if current_user.nil?
      flash[:danger] = "* Need to be logged in."
      redirect_to videos_path
    else
      @video = @video.decorate(view_context)
    end
  end


  def register

    # from http://codegolf.stackexchange.com/questions/4707/outputting-ordinal-numbers-1st-2nd-3rd
    def o(n)n.to_s+%w{th st nd rd}[n/10%10==1||n%10>3?0:n%10]end

    vu = VideoUser.where( :user_id => current_user.id, :video_id => @video.id)
    if vu.empty?
      vu = VideoUser.new
      vu.user_id    = current_user.id
      vu.video_id   = @video.id
      vu.iterations = 1

      if vu.save
        render :json => { :message => "Video registered to #{current_user.name} - 1st viewing." } 
      else
        pDebug("Register error: #{vu.errors.messages}")
        render :json => { :message => "Couldn't register video to #{current_user.name}; error=#{vu.errors.messages}" } 
      end
    else
      vu[0].iterations += 1
      if vu[0].save
        msg = "This will be the #{o(vu[0].iterations)} viewing of this video"
        render :json => { :message => msg} 
      else
        pDebug("Register error: #{vu.errors.messages}")
        render :json => { :message => "Couldn't register video to #{current_user.name}; error=#{vu.errors.messages}" } 
      end
    end
  end


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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name)
    end
end
