class User < ApplicationRecord
  has_many :yoyakus
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

    validates_format_of :first_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください'
    validates_format_of :last_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください'
    validates_format_of :email, with: /\A[^@\s]+@[^@\s]+\z/, message: 'は有効なEメールアドレスではありません'
    validates :first_name, :last_name, presence: true

  end
