Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  root to: "prototypes#index"
  resources :prototypes, only: [:index, :new, :create]
  #onlyで必要なルーティングのみ設定することで可読性が上がる
  #アプリケーションのデータ量も少なくなる（微量ではある）
end
