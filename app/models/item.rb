class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :deadline
  belongs_to :load
  belongs_to :area
  # has_one :order

  validates :item_name, presence: true
  validates :category_id, presence: true
  validates :area_id, presence: true
  validates :condition_id, presence: true
  validates :price, presence: true,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :load_id, presence: true
  validates :deadline_id, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :load_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :deadline_id, numericality: { other_than: 1 , message: "can't be blank"} 

  


end
