Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lists#index"

  get "lists", to: "lists#index"
  get "lists/new", to: "lists#new"
  post  "lists", to: "lists#create"
  get "lists/:id", to: "lists#show", as: "list"
  delete "lists/:id", to: "lists#destroy"

  get "lists/:id/bookmarks/new", to: "bookmarks#new", as: "list_bookmarks"
  post "lists/:id/bookmarks/new", to: "bookmarks#create", as: 'new_list_bookmark'
  delete "bookmarks/:id", to: "bookmarks#delete"

end
