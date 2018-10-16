Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks",
     registrations: "users/registrations"}
  root "static_pages#home"
  scope "(:locale)", locale: /en|vi/ do
    get "/home", to: "static_pages#home"
  end
  resource :books
end
