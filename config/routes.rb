Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {sessions: "users/sessions"}
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
  end
end
