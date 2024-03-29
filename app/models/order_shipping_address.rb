class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :street_address, :building, :telephone_number, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/} 
    validates :area_id, numericality: { other_than: 1 } 
    validates :city
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }    
    validates :token
    validates :user_id
    validates :item_id


  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    shipping_address = ShippingAddress.create(postal_code: postal_code, area_id: area_id, city: city, street_address: street_address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end