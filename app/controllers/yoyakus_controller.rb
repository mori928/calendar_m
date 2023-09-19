class YoyakusController < ApplicationController

  def index
    @yoyakus = Yoyaku.all
    @yoyaku = Yoyaku.new 
  end
  
  def new
    @yoyaku = Yoyaku.new
    @yoyakus = Yoyaku.all
  end

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

  def user_show
    @yoyaku = Yoyaku.find(params[:id])
    # 他の必要な処理を追加
    # 予定の詳細と予約確定フォームを表示するため、新しいビューファイルを描画
    render 'user_show'
  end

  private

  def yoyaku_parameter
    params.require(:yoyaku).permit(:title, :content, :start_time)
  end
end
