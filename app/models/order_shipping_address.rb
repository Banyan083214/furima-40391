class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :street_address, :building, :telephone_number, :order_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} 
    validates :area_id
    validates :city
    validates :street_address
    validates :telephone_number, length: { minimum: 10, maximum: 11 }, format: { with: /\A[0-9]+\z/, message: "should only contain digits" }
    validates :user_id
    validates :item_id
    validates :order_id



  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    shipping_address = ShippingAddress.create(postal_code: postal_code, area_id: area_id, city: city, street_address: street_address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end