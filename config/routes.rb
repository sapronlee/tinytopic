ActionController::Routing::Routes.draw do |map|
  map.root :controller => :posts
  map.resources :posts
  map.resources :comments
  
  map.resource :user_session, :collection => { :destroy => :any }
  map.resource :account, :controller => :users
  map.resources :users
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
