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
  @yoyaku = Yoyaku.new(yoyaku_parameter)
  @yoyakus = Yoyaku.all
  if @yoyaku.save
  redirect_to yoyakus_path, notice: "予約しました"
  else
  flash.now[:alert] = "予約に失敗しました。エラー: " + @yoyaku.errors.full_messages.join(", ")
  render 'new'
  end
end

def update
  @yoyaku = Yoyaku.find(params[:id])
  if @yoyaku.update(yoyaku_parameter)
    redirect_to yoyakus_path, notice: "編集しました"
  else
    render 'edit'
  end
end

def edit
  @yoyaku = Yoyaku.find(params[:id])
end

def destroy
  @yoyaku = Yoyaku.find(params[:id])
  @yoyaku.destroy
  redirect_to yoyakus_path, notice:"削除しました"
end


private

def yoyaku_parameter
  params.require(:yoyaku).permit(:title, :content, :start_time).merge(user_id: current_user.id)
end

end
