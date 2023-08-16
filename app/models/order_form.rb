class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :token

  with_options presence: true do
    validates :city, :addresses, :token, :user_id, :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にハイフンを含めて入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :phone_number,
              format: { with: /\A\d{10,11}\z/, message: 'を正しく入力してください' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAdd.create(postal_code: postal_code, 
                       prefecture_id: prefecture_id, 
                       city: city, 
                       addresses: addresses,
                       building_name: building_name, 
                       phone_number: phone_number, 
                       order_id: order.id)
  end
end
