class Item < ApplicationRecord
  # belongs_to :user
  has_many :images
  # belongs_to :category
  # belongs_to :brand

  # fields_forメソッドを利用する際に、親モデルの中に書く必要があるメソッド
  accepts_nested_attributes_for :images, allow_destroy: true
  
end
