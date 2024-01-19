GoBucks::Engine.routes.draw do
  resource :grant, only: [:show, :create]
  resources :transactions, only: [:index]
  resource :wallet, only: [:show, :create]
  post :reward, to: 'wallets#reward'
  root to: 'wallets#show'
end
