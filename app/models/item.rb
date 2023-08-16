class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :schedule_delivery

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :schedule_delivery_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :sales_status_id, numericality: { other_than: 1, message: "を入力してください" }
end
