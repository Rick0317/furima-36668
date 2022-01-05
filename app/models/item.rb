class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :state, :shipping_cost, :region, :ship_length

  belongs_to :user
  
  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id, :state_id, :shipping_cost_id, :region_id, :ship_length_id
  end

  with_options presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of setting range'}do
    validates :price,  format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' } 
  end
  validates :name, presence: true
  validates :description, presence: true

  has_one_attached :image
   

 
end
