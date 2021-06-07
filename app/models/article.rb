class Article < ApplicationRecord
  with_oprions presence: true do
    validates :title, :content
    validates :category_id, numericality: { other_than: 0 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  belongs_to :user
  has_one_attached :image
end
