class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 10 }
  validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input alphabet & numeral characters. ' }

  has_many :articles
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_articles, through: :likes, source: :article

  def own?(object)
    id == object.user_id
  end

  def like(article)
    likes.find_or_create_by(article: article)
  end

  def like?(article)
    like_articles.include?(article)
  end

  def unlike(article)
    like_articles.delete(article)
  end
end
