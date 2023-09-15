class User < ApplicationRecord

    has_many :yoyakus

    validates_format_of :personal_id, with: /\A\d{7}\z/, message: 'は半角数値7桁のみで入力してください'
    validates_format_of :email, with: /\A[^@\s]+@[^@\s]+\z/, message: 'は有効なEメールアドレスではありません'
    validates_format_of :comment
    validates_format_of :yoyaku_id
    validates :personal_id, :email, :yoyaku_id, presence: true

end
