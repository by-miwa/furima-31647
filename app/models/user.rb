class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, uniqueness: true   
         validates :password, confirmation: true     
         validates :nickname, presence: true         
         validates :last_name, presence: true         
         validates :first_name, presence: true         
         validates :last_name_kana, presence: true         
         validates :first_name_kana, presence: true         
         validates :birthday, presence: true         
    

end

#新規登録/ユーザー情報
#!メールアドレスが一意性であること
#メールアドレスは、@を含む必要があること
#パスワードは、6文字以上での入力が必須であること
#パスワードは、半角英数字混合での入力が必須であること
#!パスワードとパスワード（確認用）、値の一致が必須であること

#新規登録/本人情報確認
#ユーザー本名は、名字と名前がそれぞれ必須であること
#ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
#ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること
#ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること