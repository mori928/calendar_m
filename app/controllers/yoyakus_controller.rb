class YoyakusController < ApplicationController
  def index
    # データの取得
    @yoyakus = Yoyaku.all
    # render yoyakus#index
  end
  
  def new
    @yoyaku = Yoyaku.new
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

  private

  def yoyaku_parameter
    params.require(:yoyaku).permit(:title, :content, :start_time)
  end
end
