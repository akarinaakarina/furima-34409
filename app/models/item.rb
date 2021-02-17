class Item < ApplicationRecord

  has_one :buy
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_style
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price, format: {with: /\A[0-9]+\z/, message:'には半角数字での入力をしてください'}
  end

  validates_inclusion_of :price, in: 300..9999999

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_style_id
    validates :prefecture_id
    validates :delivery_day_id
  end 
end

