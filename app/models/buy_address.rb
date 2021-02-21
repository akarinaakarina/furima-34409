class BuyAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :phone_number, :building_name, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "の登録にはハイフンが必要です"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "の登録には11桁以内の半角数字のみです"}
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name, buy_id: buy.id)
  end
end