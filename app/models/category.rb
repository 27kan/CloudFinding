class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: ' -- ' },
    { id: 1, name: ' アイディアが欲しい ' },
    { id: 2, name: ' 実現させたい ' },
    { id: 3, name: ' 仲間が欲しい ' }
  ]

  include ActiveHash::Associations
  has_many :articles
  
end
