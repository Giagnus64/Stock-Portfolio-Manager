Rails.application.routes.draw do
  resources :transactions
  resources :stocks
  resources :users
      #resources :stocks, only:[:index, :create]
end
