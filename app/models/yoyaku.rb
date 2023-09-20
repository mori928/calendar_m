class Yoyaku < ApplicationRecord
  
  belongs_to :guest, optional: true
  belongs_to :user
  
  validates :title,  presence: true #, allow_blank: true
  validates :start_time,  presence: true #, allow_blank: true
  validates :content,  presence: true #, allow_blank: true
end

