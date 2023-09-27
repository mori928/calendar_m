class Yoyaku < ApplicationRecord
  
  default_scope -> { where(deleted_at: nil) }

  # ソフトデリートのメソッド
  # def soft_delete
  #   update(deleted_at: Time.current)
  # end

  has_many :bookings
  belongs_to :user
  
  validates :title,  presence: true #, allow_blank: true
  validates :start_time,  presence: true #, allow_blank: true
  validates :content,  presence: true #, allow_blank: true
end

