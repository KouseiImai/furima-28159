class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  with_options presence: true do
    with_options format: { with: /\A[あ-んア-ンー-龥]+\z/ } do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: /\A[ア-ンー]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
    end

    validates :nickname
    validates :email, uniqueness: true, format: { with: /@./ }
    validates :password, format: { with: /[a-z\d]{6,}/ }
    validates :password_confirmation, format: { with: /[a-z\d]{6,}/ }
    validates :birthday
  end
end
