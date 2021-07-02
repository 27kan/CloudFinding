class Like < ApplicationRecord
  belongs_to :user
  belongs_to :article, counter_
end
