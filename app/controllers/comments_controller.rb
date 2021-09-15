class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params) #ストロングパラメーターを引数にしている
    if @comment.save
      redirect_to "/prototypes/#{@comment.prototype.id}" #commentとprototypeを.で繋ぐ
    else
      @prototype = @comment.prototype #commentとprototypeを.で繋ぐ
      render "prototypes/show"
    end
  end

  private

  def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id] )
  #merge（key: value, key: value）→Commentモデルのuser_idカラムと融合する値、prototypes_idカラムと融合する値を指定する
  #params[:prototype_id]→[:prototype_id]はcommentのparamsに親のprototypeのIDを追加して送った値になる
  end
end
