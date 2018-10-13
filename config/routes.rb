Rails.application.routes.draw do
  get 'users/show'
  get 'user/show'
  get 'categories/show'
  get 'authors/show'
  devise_for :users, controllers: {sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks",
     registrations: "users/registrations"}
  root "static_pages#home"
  scope "(:locale)", locale: /en|vi/ do

  end
  resources :books
  resources :users , only: [:index, :show]
  resources :categories
  resources :authors
  resources :bookmarks
  resources :reviews
end
