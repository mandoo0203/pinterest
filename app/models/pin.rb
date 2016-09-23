class Pin < ApplicationRecord
  validates_presence_of :description

  belongs_to :user
  has_attached_file :pin_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pin_image, content_type: /\Aimage\/.*\z/


  def repost(user)
    repost_pin = self.dup
    repost_pin.user_id = user.id
    repost_pin.original_pin_id = self.id
    repost_pin.pin_image = self.pin_image
    repost_pin.save

  end

  def is_repost?
    self.original_pin_id.present?
  end

  def original_pin
    Pin.find(original_pin_id) if is_repost?
  end


end
