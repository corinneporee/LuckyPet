Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :dogs do
    resources :friendships, only: %i[create]
  end

  resources :friendships, only: %i[index]

  resources :spots do
    resources :walks, only: %i[new create]
    resources :reviews, only: %i[create]
  end

  resources :walks, only: %i[index show] do

    resources :invitations, only: %i[create]
  end
  resources :invitations, only: [] do
    member do
      patch :accept
    end
  end

  get "/feeds", to: "feeds#index", as: "feeds"
  get "/feeds/:friendship_id/accept", to: "feeds#accept_friend"
  get "/feeds/:friendship_id/refuse", to: "feeds#refuse_friend"

  get "/feeds/:invitation_id/accept", to: "feeds#accept_invit"
  # Defines the root path route ("/")
  # root "articles#index"
end
