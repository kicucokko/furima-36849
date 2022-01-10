class PurchaseReceiver
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :block, :build, :phone,  :user_id, :item_id,:token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :city
    validates :block
    validates :phone,format: { with: /\A[0-9]{10,11}\z/ ,message: "is invalid. Input only number"}
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Receiver.create(zip: zip, prefecture_id: prefecture_id, city: city, block: block, build: build, phone: phone, purchase_id: purchase.id)
  end

end