GoBucks::Engine.routes.draw do
  resources :transactions, only: [:index]
  resource :wallet, only: [:show, :create]
  post :reward, to: 'wallets#reward'
  root to: 'wallets#show'
end
