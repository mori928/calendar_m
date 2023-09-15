class Yoyaku < ApplicationRecord
  
  
  has_one :user
  validates :title, presence: true
  validates :discus_type_id, presence: true
  validates :start_time, presence: true
  validates :content, presence: true

end

