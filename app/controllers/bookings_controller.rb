class BookingsController < ApplicationController
  include ActiveModel::Model
  attr_accessor :yoyaku_id, :guest_id

  

  def save
    yoyaku = Yoyaku.create(yoyaku_id: yoyaku_id)
    Guest.create(guest_id: guest.id)
  end

end
