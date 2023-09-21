class Guest < ApplicationRecord
  # belongs_to :yoyaku, optional: true

  validates_format_of :parson_no, with: /\A\d{7}\z/, message: 'は半角数値7桁のみで入力してください'
  validates_format_of :email, with: /\A[^@\s]+@[^@\s]+\z/, message: 'は有効なEメールアドレスではありません'
  validates :comment,  length: { maximum: 1000 }, allow_blank: true
  validates :parson_no, :email, presence: true
    
end

