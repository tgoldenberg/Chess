Rails.application.routes.draw do

  devise_for :users
  resources :invitations do
    resources :rooms do
      resources :moves
    end
  end

  post '/pusher/auth' => 'pusher#auth'
  root 'static_pages#home'

end
