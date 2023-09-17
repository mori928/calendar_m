class YoyakusController < ApplicationController
  def index
    @yoyakus = Yoyaku.all
    @yoyaku = Yoyaku.new
    render 'yoyakus/index' 
  end
  
  def new
    @yoyaku = Yoyaku.new
  end

  # def create
  #   @yoyaku = Yoyaku.find(params[:id])
  #   if current_user.admin?
  #     # 管理者の場合の遷移先
  #   elsif current_user?
  #     @yoyaku = Yoyaku.new(yoyaku_params)
  #   else
  #     # 一般ユーザーの場合の遷移先
  #   end
  # end
  

  def show
    @yoyaku = Yoyaku.find(params[:id])
  end

  def create
    Yoyaku.create(yoyaku_parameter)
    redirect_to yoyakus_path
  end

  def destroy
    @yoyaku = Yoyaku.find(params[:id])
    @yoyaku.destroy
    redirect_to yoyakus_path, notice:"削除しました"
  end

  def edit
    @yoyaku = Yoyaku.find(params[:id])
  end

  def update
    @yoyaku = Yoyaku.find(params[:id])
    if @yoyaku.update(yoyaku_parameter)
      redirect_to yoyakus_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def yoyaku_parameter
    params.require(:yoyaku).permit(:title, :content, :start_time)
  end
end
