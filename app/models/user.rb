class User < ApplicationRecord

  has_many :questions, dependent: :destroy

  has_many :posts, dependent: :destroy

  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: 'post'

  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  has_many :talks, dependent: :destroy

  validates :name, presence:true, length: {maximum: 8}, on: [:create, :update]

  #新規登録時のみバリデーション実行
  VALID_EMAIL_REGEX=/[a-z0-9]+@[a-z0-9]+\.[a-z0-9]+/
  validates :email, presence:true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, on: :create

  #新規登録時のみバリデーション実行
  VALID_PASSWORD_REGEX=/(?=.*[a-z])(?=.*\d)/
  validates :password, length: {minimum: 8, maximum: 20}, format: {with: VALID_PASSWORD_REGEX}, on: :create

  #年齢が数字で60歳〜90歳でなければ弾く
  validates :age,
   numericality:{
     only_integer: true,
     greater_than: 59,
     less_than: 91,
     allow_blank: true
   }

  #enumでgemderカラムの表示処理
  enum gender: %i(男性 女性)

  enum residence: %i(北海道 青森県 岩手県 宮城県 秋田県 山形県 福島県 茨城県 栃木県 群馬県 千葉県 東京都 神奈川県 新潟県
  富山県 石川県 福井県 山梨県 長野県 静岡県 岐阜県 愛知県 三重県 滋賀県 奈良県 京都府 大阪府 兵庫県 和歌山県 岡山県 広島県
  山口県 鳥取県 島根県 香川県 徳島県 愛媛県 高知県 福岡県 大分県 佐賀県 長崎県 熊本県 宮崎県 鹿児島県 沖縄県
  )

  #uploader
  mount_uploader :image, ImageUploader

  has_secure_password

  #最新の登録を一番上に表示
  scope :recent, ->{order(created_at: :desc)}

  #名前による検索
  scope :search_by_name, ->(name){
    where("name like ?", "%#{name}%")
  }

  #年齢による検索
  scope :search_by_age, ->(age){
    where(age: age)
  }

  #性別による検索
  scope :search_by_gender, ->(gender){
    where(gender: gender)
  }

  #居住地による検索
  scope :search_by_residence, ->(residence){
    where(residence: residence)
  }

  #お互いフォローしていればマッチング
  def matchers
    User.where(id: passive_relationships.select(:following_id))
        .where(id: active_relationships.select(:follower_id))
  end

  #フォローしようとしているユーザーがフォローされているユーザーの中から自分がいるかどうか調べる
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

end
