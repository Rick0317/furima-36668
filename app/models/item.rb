class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :state, :shipping_cost, :region, :ship_length

  validates :category_id, :state_id, :shipping_cost_id, :region_id, :ship_length_id, numericality: { other_than: 1 , message: "can't be blank"} 
  

  validates :name, :price, presence: true
  validates :description, presence: true
  validates :state_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :ship_length_id, presence: true
  validates :region_id, presence:true
  validates :category_id, presence:true

  has_one_attached :image
end