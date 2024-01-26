GoBucks::Engine.routes.draw do
  resource :grant, only: [:show, :create]
  resources :transactions, only: [:index, :new, :create]
  resource :wallet, only: [:show, :create]
  root to: 'wallets#show'
end
