Rails.application.routes.draw do
  mount GoBucks::Engine => "/go_bucks"
  devise_for :users
  root 'home#index'
end
