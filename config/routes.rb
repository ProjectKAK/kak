Rails.application.routes.draw do
  root to: "site#index"

  # get 'site/index', to: "site#index"
  get 'site/results', to: 'site#results'
  get "site/about"
  get "site/contact"
  post 'site/search', to: 'site#search'

  # post "/sessions", to: "sessions#create"
  get "/sign_up", to: "users#new", as: "sign_up"
  get "/login", to: "sessions#new", as: "login"
  post 'site/sandbox.json', to: 'site#sandbox'
  
  delete "logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"

  get "passwords/new", to: "passwords#new", as: "new_password"
  get "passwords/:id/edit", to: "passwords#edit", as: "edit_password"
  post "/passwords", to: "passwords#create" 
  post "/passwords/:id", to: "passwords#update"

  get "/profile", to: "users#profile"
  resources :users, except: [:show]
  resources :site
  resources :sessions, only: [:create, :destroy]
 
  resources :useringredients

end

#              Prefix Verb   URI Pattern                         Controller#Action
# 
#                root GET    /                                   site#index
#        site_results GET    /site/results(.:format)             site#results
#          site_about GET    /site/about(.:format)               site#about
#        site_contact GET    /site/contact(.:format)             site#contact
#         site_search POST   /site/search(.:format)              site#search
#            sessions POST   /sessions(.:format)                 sessions#create
#             sign_up GET    /sign_up(.:format)                  users#new
#               login GET    /login(.:format)                    sessions#new
#                     POST   /site/sandbox.json(.:format)        site#sandbox
#              logout DELETE /logout(.:format)                   sessions#destroy
#                     GET    /logout(.:format)                   sessions#destroy
#        new_password GET    /passwords/new(.:format)            passwords#new
#       edit_password GET    /passwords/:id/edit(.:format)       passwords#edit
#           passwords POST   /passwords(.:format)                passwords#create
#                     POST   /passwords/:id(.:format)            passwords#update
#             profile GET    /profile(.:format)                  users#profile
#               users GET    /users(.:format)                    users#index
#                     POST   /users(.:format)                    users#create
#            new_user GET    /users/new(.:format)                users#new
#           edit_user GET    /users/:id/edit(.:format)           users#edit
#                user PATCH  /users/:id(.:format)                users#update
#                     PUT    /users/:id(.:format)                users#update
#                     DELETE /users/:id(.:format)                users#destroy
#          site_index GET    /site(.:format)                     site#index
#                     POST   /site(.:format)                     site#create
#            new_site GET    /site/new(.:format)                 site#new
#           edit_site GET    /site/:id/edit(.:format)            site#edit
#                site GET    /site/:id(.:format)                 site#show
#                     PATCH  /site/:id(.:format)                 site#update
#                     PUT    /site/:id(.:format)                 site#update
#                     DELETE /site/:id(.:format)                 site#destroy
#                     POST   /sessions(.:format)                 sessions#create
#             session DELETE /sessions/:id(.:format)             sessions#destroy
#     useringredients GET    /useringredients(.:format)          useringredients#index
#                     POST   /useringredients(.:format)          useringredients#create
#  new_useringredient GET    /useringredients/new(.:format)      useringredients#new
# edit_useringredient GET    /useringredients/:id/edit(.:format) useringredients#edit
#      useringredient GET    /useringredients/:id(.:format)      useringredients#show
#                     PATCH  /useringredients/:id(.:format)      useringredients#update
#                     PUT    /useringredients/:id(.:format)      useringredients#update
#                     DELETE /useringredients/:id(.:format)      useringredients#destroy

