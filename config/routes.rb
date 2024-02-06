GoBucks::Engine.routes.draw do
  resource :grant, only: [:show, :create]
  resource :transfer, only: [:show, :create]
  resources :transactions, only: [:index]
  resource :wallet, only: [:show, :create] do
    get :transactions
  end
  root to: 'wallets#show'
end
