Rails.application.routes.draw do
  resources :friendships
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chat_rooms, only: [:new, :create, :show, :index]
  post 'subscribe', to: 'chat_rooms#add'
  post 'unsubscribe', to: 'chat_rooms#unsubscribe'
  get 'subscribed', to: 'chat_rooms#subscribed'
  post 'deletefriend', to: 'friendships#destroy'

  root 'chat_rooms#index'
  mount ActionCable.server => '/cable'
  get 'users' => 'users#index'

end
