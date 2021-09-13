Rails.application.routes.draw do
  devise_for :users
  # get 'prototypes/index' #初期設定で出てくるので消してOK
  root to: "prototypes#index"
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update]
  #onlyで必要なルーティングのみ設定することで可読性が上がる
  #アプリケーションのデータ量も少なくなる（微量ではある）
end
