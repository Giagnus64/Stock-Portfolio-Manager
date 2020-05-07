Rails.application.routes.draw do
  resources :users, only:[:create, :show]
      #resources :stocks, only:[:index, :create]
  #get user transactions route
  get "transactions/:user_id", to: 'transactions#show', as: "user_transactions"  
  #login route 
  post '/login', to: 'login#create', as: 'login'      
end
