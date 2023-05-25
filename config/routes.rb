Rails.application.routes.draw do
  get 'bookmarks/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: %i[new create index show] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: :destroy
end
