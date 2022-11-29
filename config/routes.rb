Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :dogs do
    resources :friendships, only: %i[create]
  end

  resources :friendships, only: %i[index]

  resources :spots do
    resources :walks, only: %i[create]
    resources :reviews, only: %i[create]
  end

  resources :walks, only: %i[show] do
    resources :invitations, only: %i[create]
  end

  patch ":id/accept", to: "invitation#accept"

  # Defines the root path route ("/")
  # root "articles#index"
end
