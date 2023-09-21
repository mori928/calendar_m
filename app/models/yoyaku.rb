class Yoyaku < ApplicationRecord
  
  default_scope -> { where(deleted_at: nil) }

  # ソフトデリートのメソッド
  def soft_delete
    update(deleted_at: Time.current)
  end


  belongs_to :guest, optional: true
  belongs_to :user, optional: true
  
  validates :title,  presence: true #, allow_blank: true
  validates :start_time,  presence: true #, allow_blank: true
  validates :content,  presence: true #, allow_blank: true
end

