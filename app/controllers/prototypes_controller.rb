class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    #newメソッド：インスタンスを生成
  end

  def create
    #Prototype.create(prototype_params)
    #createメソッド：引数に渡されたデータを元にモデルのインスタンスを生成し、データベースに保存
    @prototype = Prototype.new(prototype_params)
    # new.html.erbでインスタンスを渡す必要があるため、newアクションと同じ変数にする
    if @prototype.save
      redirect_to root_path
    else
      render :new #new:new.html.erb(renderはビューファイルに遷移)
    end
  end

  private  #Class外から呼び出し不可のメソッド/誤呼出防止/可読性向上

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image ).merge(user_id: current_user.id)
    #params.require(model).permit(:key, :key)
    #paramsが使用できるメソッド： requireメソッド / permitメソッド
  end

end
