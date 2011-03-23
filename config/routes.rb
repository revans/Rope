Rails.application.routes.draw do 
  match '/login'                  => 'social/auth#new',     :as => :login
  match '/auth/:service/callback' => 'social/auth#callback'
  match '/auth/failure'           => 'social/auth#failure'
  match '/logout'                 => 'social/auth#destroy', :as => :logout
end
