Rails.application.routes.draw do

  post '/pusher/auth' => 'pusher#auth'
  devise_for :users
  resources :invitations
  resources :rooms do
    resources :moves
  end
  
  root 'static_pages#home'

end
