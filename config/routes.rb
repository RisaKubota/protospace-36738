Rails.application.routes.draw do
  devise_for :users
  # get 'prototypes/index' #初期設定で出てくるので消してOK
  root to: "prototypes#index"
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  #onlyで必要なルーティングのみ設定することで可読性が上がる
  #アプリケーションのデータ量も少なくなる（微量ではある）

    resources :comments, only: [:create, :show]
    #ルーティングのネスト(do~end)を使いルーティングの親子関係を示すことでidを渡すことができる。
    #ルーティングのネスト：親のidをparamsに追加して子供側に受け渡しを行う
  end
end
