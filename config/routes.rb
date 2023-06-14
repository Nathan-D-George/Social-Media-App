Rails.application.routes.draw do


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'home#home'
  get '/about',       to: 'home#about'
  get '/fake_secret', to: 'home#fakesecret'
  get '/secret',      to: 'home#secret'

  get '/sign_up', to: 'registrations#new_user'
  post'/sign_up', to: 'registrations#add_user'

  get    '/sign_in', to: 'sessions#new_form'
  post   '/sign_in', to: 'sessions#new_session'
  delete 'sign_out', to: 'sessions#destroy_session'

  get   '/view_profile',   to: 'user#view_profile'
  get   '/edit_profile',   to: 'user#edit_profile'
  patch '/update_profile', to: 'user#update_profile'

  #get '/feed', to: 'social#feed'
  #get '/dms',  to: 'social#dms'
end


# ___________TO DO 14 JUNE 2023 :____________ CREATE MESSAGE MODEL______OR_______CREATE POST MODEL