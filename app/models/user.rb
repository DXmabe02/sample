class User < ApplicationRecord
  before_save{self.email = email.downcase}
#activerecocrdのcallbackメソッドを使って
#ユーザーをDBに保存する前にemail属性を強制的に小文字に変換している
  validates :name, presence: true,
                   length:{maximum: 50}
  VALD_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length:{maximum: 252},
                    format:{with: VALD_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
#case_sensitiveは小文字と大文字を区別するオプション
#falseにすることで区別しないとしている
#uniquenessはオプションを付けると自動的にuniqueness: trueと判断する

end
