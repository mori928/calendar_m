class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def new
    @yoyaku = Yoyaku.find(params[:yoyaku_id])
    @guest = Guest.new
    @bookings = Booking.where(yoyaku_id: @yoyaku.id)
  end


  def create
  @guest = Guest.new(guest_params)
    if @guest.save
      booking = Booking.new(yoyaku_id: @guest.yoyaku_id, guest_id: @guest.id, parson_no: @guest.parson_no)
      if booking.save
        redirect_to new_yoyaku_guest_path(@guest.yoyaku_id), notice: "予約が登録されました。"
      else
    # 保存に失敗した場合の処理
        render :new
      end
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
