Rails.application.routes.draw do
  resources :rules
  resources :videos
  resources :badges
  resources :users
  resources :companies


  get '/log_in/:id' => 'application#log_in', as: :log_in
  get '/log_out' => 'application#log_out', as: :log_out

  get 'video/:id/play',      to: 'videos#play',      as: :video_play
  get 'video/:id/register',  to: 'videos#register',  as: :video_register

  root 'companies#index'

end
