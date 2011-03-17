Rails.application.routes.draw do 
  resources :socials

  match 'auth/:provider/callback' => 'socials#create'

end
