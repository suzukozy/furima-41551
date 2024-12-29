class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name, format: {
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
      # message: 'は漢字、ひらがな、カタカナのみで入力してください'
    }
    validates :last_name_kana, format: {
      with: /\A[ァ-ヶー]+\z/
      # message: 'はカタカナのみで入力してください'
    }
    validates :first_name, format: {
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
      # message: 'は漢字、ひらがな、カタカナのみで入力してください'
    }
    validates :first_name_kana, format: {
      with: /\A[ァ-ヶー]+\z/
      # message: 'はカタカナのみで入力してください'
    }
    validates :birthday
  end

  validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/i
    # message: 'は半角英数字混合、６文字以上で入力してください'
  }
end
