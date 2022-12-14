class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id,:city, :street_address, :name_of_the_building,:telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, name_of_the_building: name_of_the_building, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end

end