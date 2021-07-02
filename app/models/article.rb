class Article < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :content, unless: :was_attached?
    validates :category_id, numericality: { other_than: 0 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def was_attached?
    self.image.attached?
  end
end
