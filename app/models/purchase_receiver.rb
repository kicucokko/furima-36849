class PurchaseReceiver
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :block, :build, :phone,  :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :block
    validates :phone,format: { with: /\A[0-9]{11}\z/ }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Receiver.create(zip: zip, prefecture_id: prefecture_id, city: city, block: block, build: build, phone: phone, purchase_id: purchase.id)
  end

end