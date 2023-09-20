class Yoyaku < ApplicationRecord
  
  belongs_to :user, optional: true
  belongs_to :admin
  
  validates :title,  presence: true #, allow_blank: true
  validates :start_time,  presence: true #, allow_blank: true
  validates :content,  presence: true #, allow_blank: true
end

