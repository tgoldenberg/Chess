Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions"}
  resources :invitations
  resources :boards

  resources :conversations do
    resources :messages
  end
  resources :rooms do
    resources :moves
  end

  post '/pusher/auth' => 'pusher#auth'

  root 'static_pages#home'
end
