Rails.application.routes.draw do
  devise_for :users
  root 'cospuls#index'

  resources :cospuls do
    collection do
      get 'search'
    end
    resources :cospul_details
  end

  resources :tags


  post   '/like/:cospul_id' => 'likes#like'     ,as: 'like'
  delete '/like/:cospul_id' => 'likes#unlike'   ,as: 'unlike'
  get    '/like/:user_id'   => 'likes#show'     ,as: 'show'
  get    'rakuten_index'    => 'rakuten#index'
  get    'game'             => 'game#show'     ,as: 'game/show'
  get    'game/tetris'      => 'game#tetris'   ,as: 'game/tetris'
  get    'game/omikuji'     => 'game#omikuji'  ,as: 'game/omikuji'
  get    'game/kaonashi'    => 'game#kaonashi' ,as: 'game/kaonashi'
end
