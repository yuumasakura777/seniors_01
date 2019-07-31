class User < ApplicationRecord

  has_many :questions, dependent: :destroy

  belongs_to :residence

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
  enum gender: %i(男性 女性)



  #uploader
  mount_uploader :image, ImageUploader

  has_secure_password






end
