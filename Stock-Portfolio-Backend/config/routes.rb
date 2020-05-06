Rails.application.routes.draw do
  resources :stocks
  #resources :stocks, only:[:index, :create]
  resources :transactions
  resources :users
  #get "user_recipes/:id", to: 'user_recipes#index', as: "saved_recipes"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
