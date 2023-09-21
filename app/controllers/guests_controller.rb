class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def new
    @yoyaku = Yoyaku.find(params[:yoyaku_id])
    @guest = Guest.new
  end

  # def create
  #   @guest = Guest.new(guest_params)
  #   if @guest.save
  #     redirect_to new_yoyaku_guest_path(@guest.yoyaku_id), notice: "予約が登録されました。"
  #   else
  #     # 保存に失敗した場合の処理
  #     render :new
  #   end
  # end

  def create
  @guest = Guest.new(guest_params)
  # @guest.yoyaku_id = params[:guest][:yoyaku_id]
    if @guest.save
      redirect_to new_yoyaku_guest_path(@guest.yoyaku_id), notice: "予約が登録されました。"
    else
    # 保存に失敗した場合の処理
      render :new
    end
  end

  def show
    @yoyaku = Yoyaku.find(params[:yoyaku_id])
    # puts "yoyaku_id from params: #{params[:yoyaku_id]}" 
  end
  
  private

  def guest_params
    params.require(:guest).permit(:parson_no, :email, :comment).merge( yoyaku_id: params[:yoyaku_id])
  end
end
