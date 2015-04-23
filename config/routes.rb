Rails.application.routes.draw do

  get 'modal/register' => 'modal#register'

  resources :conversations do
    resources :messages
  end
  post '/pusher/auth' => 'pusher#auth'
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions"}
  resources :invitations
  resources :rooms do
    resources :moves
  end
  root 'static_pages#home'
end
