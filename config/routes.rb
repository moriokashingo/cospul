Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cospuls#index'

  resources :cospuls do
    resources :cospul_details
  end

  resources :tags
  resources :users

  post   '/like/:cospul_id' => 'likes#like'     ,as: 'like'
  delete '/like/:cospul_id' => 'likes#unlike'   ,as: 'unlike'
  get    '/like/:user_id'   => 'likes#show'     ,as: 'show'
  get    'rakuten_index'    => 'rakuten#index'
  get    'intro'            => 'intro#show'     ,as: 'intro/show'
  get    'intro/tetris'     => 'intro#tetris'   ,as: 'intro/tetris'
  get    'intro/omikuji'    => 'intro#omikuji'     ,as: 'intro/omikuji'
  get    'intro/kaonashi'   => 'intro#kaonashi' ,as: 'intro/kaonashi'
end
