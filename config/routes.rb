Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'home#home'
  get '/about',       to: 'home#about'
  get '/fake_secret', to: 'home#fakesecret'
  get '/secret',      to: 'home#secret'

  #get '/feed', to: 'social#feed'
  #get '/dms',  to: 'social#dms'
end
