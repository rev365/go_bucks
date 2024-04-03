GoBucks::Engine.routes.draw do
  resource :charge, only: [:show, :create]
  resource :grant, only: [:show, :create]
  resources :transactions, only: [:index]
  resource :wallet, only: [:show, :create] do
    get :transactions
  end
  root to: 'wallets#show'
end
