class User < ApplicationRecord

  validates :name, presence:true, length: {maximum: 10}

  VALID_EMAIL_REGEX=/[a-z0-9]+@[a-z0-9]+\.[a-z0-9]+/
  validates :email, presence:true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}

  VALID_PASSWORD_REGEX=/[a-z0-9]+/
  validates :password, length: {minimum: 8, maximum: 20}, format: {with: VALID_PASSWORD_REGEX}



  has_secure_password

  #enumdでageカラムの表示処理
  enum age: %i(60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78
    79 80 81 82 83 84 85 86 87 88 89 90)

  #enumでgemderカラムの表示処理
  enum gender: %i(男性 女性)

  #enumでresidenceカラムの表示処理
  enum residence: %i(北海道 青森県 岩手県 宮城県 秋田県 山形県 福島県 茨城県 栃木県 群馬県 千葉県 埼玉県
    東京都 神奈川県 新潟県 山梨県 静岡県 長野県 富山県 石川県 福井県 岐阜県 愛知県 三重県 滋賀県 京都府 大阪府
    兵庫県 奈良県 和歌山県 岡山県 広島県 鳥取県 島根県 山口県 香川県 徳島県 愛媛県 高知県 大分県 福岡県 佐賀県
    長崎県 熊本県 宮崎県 鹿児島県 沖縄県)





end
