class UsersController < ApplicationController
  
  def index
  end

  def new
    @yoyaku = Yoyaku.find(params[:yoyaku_id])
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user.yoyaku = params[:user][:yoyaku_id] 
    if @user.save
      # 保存に成功した場合の処理
      redirect_to new_yoyaku_user_path, notice: "予約が登録されました。"
    else
      # 保存に失敗した場合の処理
      render 'new'
    end
  end

  def show
    @yoyaku = Yoyaku.find
  end
  


  private

  def user_params
    params.require(:user).permit(:parson_no, :email, :comment).merge( yoyaku_id: params[:yoyaku_id])
  end
end