class UsersController < ApplicationController
    belongs_to :yoyaku
    
    def create
      @user = User.new(user_params) # フォームデータを元にUserオブジェクトを作成
      if @user.save
        # 保存に成功した場合の処理
        redirect_to @user, notice: '予約が登録されました。'
      else
        # 保存に失敗した場合の処理
        render 'new'
      end
    end# 他のバリデーションなど
end

private

def user_params
  params.require(:user).permit(:personal_id, :email, :comment, :yoyaku_id) # 必要な属性を指定
end
