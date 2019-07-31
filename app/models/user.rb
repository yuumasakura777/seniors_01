class User < ApplicationRecord

  has_many :questions, dependent: :destroy
  has_many :residences, dependent: :destroy

  validates :name, presence:true, length: {maximum: 10}

  #新規登録時のみバリデーション実行
  VALID_EMAIL_REGEX=/[a-z0-9]+@[a-z0-9]+\.[a-z0-9]+/
  validates :email, presence:true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, on: :create

  #新規登録時のみバリデーション実行
  VALID_PASSWORD_REGEX=/[a-z0-9]+/
  validates :password, length: {minimum: 8, maximum: 20}, format: {with: VALID_PASSWORD_REGEX}, on: :create

  #enumdでageカラムの表示処理
  enum age: %i(60歳 61歳 62歳 63歳 64歳 65歳 66歳 67歳 68歳 69歳 70歳 71歳 72歳 73歳 74歳 75歳 76歳 77歳 78歳
    79歳 80歳 81歳 82歳 83歳 84歳 85歳 86歳 87歳 88歳 89歳 90歳)

  #enumでgemderカラムの表示処理
  enum gender: {男性:1,女性:2}

  #enumでresidenceカラムの表示処理
  enum residence_id: %i(北海道 青森県 岩手県 宮城県 秋田県 山形県 福島県 茨城県 栃木県 群馬県 千葉県 埼玉県
    東京都 神奈川県 新潟県 山梨県 静岡県 長野県 富山県 石川県 福井県 岐阜県 愛知県 三重県 滋賀県 京都府 大阪府
    兵庫県 奈良県 和歌山県 岡山県 広島県 鳥取県 島根県 山口県 香川県 徳島県 愛媛県 高知県 大分県 福岡県 佐賀県
    長崎県 熊本県 宮崎県 鹿児島県 沖縄県)

  #uploader
  mount_uploader :image, ImageUploader

  has_secure_password






end
