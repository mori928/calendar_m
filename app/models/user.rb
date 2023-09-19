class User < ApplicationRecord

    has_many :yoyakus

    validates_format_of :personal_id, with: /\A\d{7}\z/, message: 'は半角数値7桁のみで入力してください'
    validates_format_of :email, with: /\A[^@\s]+@[^@\s]+\z/, message: 'は有効なEメールアドレスではありません'
    validates :comment,  length: { maximum: 1000 }, allow_blank: true
    validates :personal_id, :email, :yoyaku_id, presence: true

end
