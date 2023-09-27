class YoyakusController < ApplicationController

  def index
    @yoyakus = Yoyaku.all
    @yoyaku = Yoyaku.new 
    @bookings = Booking.where(yoyaku_id: @yoyakus.map(&:id))
    # @guest = Guest.find_by(yoyaku_id: @yoyaku.id) if @yoyaku_ids.present?
    # if @guest.present?
    # @yoyakus = yoyaku.includes(:user).order("created_at DESC")
  end

  # def index
  #   @yoyakus = Yoyaku.all
  #   @yoyaku = Yoyaku.new 
  #   @yoyaku_ids = Guest.pluck(:yoyaku_id)
  #   @guest = Guest.find_by(id: @yoyaku_ids.first) if @yoyaku_ids.present?
  #   # Guestに関連するYoyakuレコードを取得
  #   if @guest.present?
  #     @yoyaku_records = Yoyaku.where(id: @yoyaku_ids)
  #   else
  #     @yoyaku_records = [] # ゲストが存在しない場合は空の配列をセット
  #   end
  # end

def new
  @yoyaku = Yoyaku.new
  @yoyakus = Yoyaku.all
end

def show
  @yoyaku = Yoyaku.find(params[:id])
  @Booking = @yoyaku.bookings
end


def create
  guest = Guest.find(params[:guest_id])       # ゲストと関連付け
  @yoyaku = Yoyaku.new(yoyaku_parameter)
  @yoyaku.guest = guest  # ゲストと関連付け

  if @yoyaku.save
    booking = Booking.create(yoyaku_id: @yoyaku.id, guest_id: guest.id)
    redirect_to yoyakus_path, notice: "予約しました"
  else
  flash.now[:alert] = "予約に失敗しました。エラー: " + @yoyaku.errors.full_messages.join(", ")
  render 'new'
  end
end

def update
  @yoyaku = Yoyaku.find(params[:id])
  if @yoyaku.update(yoyaku_parameter)
    redirect_to yoyakus_path
  else
    render 'edit'
  end
end

def edit
  @yoyaku = Yoyaku.find(params[:id])
end

def destroy
  @yoyaku = Yoyaku.find(params[:id])
  @yoyaku.soft_delete # ソフトデリートのメソッドを呼び出す
  redirect_to yoyakus_path, notice: "予約が削除されました。"
end

# def destroy
#   @yoyaku = Yoyaku.find(params[:id])
#   @yoyaku.destroy
#     redirect_to yoyakus_path, notice:"削除しました"
# end

# def cancel
#   @yoyaku = Yoyaku.find(params[:id])
#   if @yoyaku.guests.empty?
#     ActiveRecord::Base.transaction do
#       @yoyaku.destroy
#     end
#     flash[:notice] = "予約が削除されました。"
#     redirect_to yoyakus_path
#   else
#     flash[:alert] = "ゲストが存在するため、予約を削除できません。"
#     redirect_to yoyaku_path(@yoyaku)
#   end
# end



private

def yoyaku_parameter
  params.require(:yoyaku).permit(:title, :content, :start_time).merge(user_id: current_user.id)
end

end
