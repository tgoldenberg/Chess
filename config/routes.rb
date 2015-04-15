Rails.application.routes.draw do

  devise_for :users
  resources :invitations do
    resources :rooms do
      resources :moves
    end
  end

  root 'static_pages#home'

end
