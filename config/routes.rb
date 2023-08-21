Rails.application.routes.draw do
  root to: "movies#index"
  resources :movies, only: [:index, :show]

  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]
end
