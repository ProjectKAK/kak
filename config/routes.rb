Rails.application.routes.draw do
  root to: "site#index"

  # get 'site/index'
  get "site/about"
  get "site/contact"

  get "/sign_up", to: "users#new", as: "sign_up"
  get "/login", to: "sessions#new", as: "login"

  # post "/sessions", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "passwords/new", to: "passwords#new", as: "new_password"
  get "passwords/:id/edit", to: "passwords#edit", as: "edit_password"
  post "/passwords", to: "passwords#create" 
  post "/passwords/:id", to: "passwords#update"

  resources :users
  resources :sessions, only: [:create, :destroy]
end

#        Prefix Verb   URI Pattern               Controller#
# 
# passwords_new GET    /passwords/new(.:format)  passwords#new
#    site_index GET    /site/index(.:format)     site#index
#    site_about GET    /site/about(.:format)     site#about
#  site_contact GET    /site/contact(.:format)   site#contact
#         login GET    /login(.:format)          sessions#new
#      sessions POST   /sessions(.:format)       sessions#create
#       sign_up GET    /sign_up(.:format)        users#new
#        logout DELETE /logout(.:format)         sessions#destroy
#               POST   /passwords/:id(.:format)  passwords#update
#         users GET    /users(.:format)          users#index
#               POST   /users(.:format)          users#create
#      new_user GET    /users/new(.:format)      users#new
#     edit_user GET    /users/:id/edit(.:format) users#edit
#          user GET    /users/:id(.:format)      users#show
#               PATCH  /users/:id(.:format)      users#update
#               PUT    /users/:id(.:format)      users#update
#               DELETE /users/:id(.:format)      users#destroy
#               POST   /sessions(.:format)       sessions#create
#  new_sessions GET    /sessions/new(.:format)   sessions#new
# edit_sessions GET    /sessions/edit(.:format)  sessions#edit
#               GET    /sessions(.:format)       sessions#show
#               PATCH  /sessions(.:format)       sessions#update
#               PUT    /sessions(.:format)       sessions#update
#               DELETE /sessions(.:format)       sessions#destroy