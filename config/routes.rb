Rails.application.routes.draw do
  root "site#index"

  get 'site/index', to: "site#index"

  post 'site/search', to: 'site#search'

  get 'site/results', to: 'site#results'

  
  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  delete "logout", to: "sessions#destroy"

  resources :users
  resource :sessions
end

#     login GET    /login(.:format)          sessions#new
#      sessions POST   /sessions(.:format)       sessions#create
#       sign_up GET    /sign_up(.:format)        users#new
#        logout DELETE /logout(.:format)         sessions#destroy
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