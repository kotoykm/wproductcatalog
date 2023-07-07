Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :products
  resources :categories

  post '/reactions', to: 'reactions#user_reaction', as: 'user_reaction'
  get '/my_reactions', to: 'reactions#product_with_reactions', as: 'my_reactions' #NO ES JUSTO YO TENGO EL MONOPOLIO SOBRE LOS NOMBRES MY
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
end
