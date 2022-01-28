class Order < ApplicationRecord
  validates :price, presence: true
  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
    validates  :shipping_cost_id
  end
  validates :image, presence: true
  validates :name, presence: true

  belongs_to :item
end
