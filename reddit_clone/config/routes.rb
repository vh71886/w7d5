Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#      Prefix Verb   URI Pattern                                                                              Controller#Action
#       users GET    /users(.:format)                                                                         users#index
#             POST   /users(.:format)                                                                         users#create
#    new_user GET    /users/new(.:format)                                                                     users#new
#   edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#        user GET    /users/:id(.:format)                                                                     users#show
#             PATCH  /users/:id(.:format)                                                                     users#update
#             PUT    /users/:id(.:format)                                                                     users#update
# new_session GET    /session/new(.:format)                                                                   sessions#new
#     session DELETE /session(.:format)                                                                       sessions#destroy
#             POST   /session(.:format)                                                                       sessions#create
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
end
