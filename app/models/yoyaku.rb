class Yoyaku < ApplicationRecord
  
  # belongs_to :user
  
  validates :title, presence: true
  validates :start_time, presence: true
  validates :content, presence: true

end

