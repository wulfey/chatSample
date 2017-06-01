Rails.application.routes.draw do
  resources :friendships
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chat_rooms
  get 'subscribe', to: 'chat_rooms#add'
  get 'unsubscribe', to: 'chat_rooms#unsubscribe'
  get 'subscribed', to: 'chat_rooms#subscribed'
  post 'deletefriend', to: 'friendships#destroy'
  delete 'deletechat', to: 'chat_rooms#destroy'

  root 'chat_rooms#index'
  mount ActionCable.server => '/cable'


    
  get 'users' => 'users#index'

end
