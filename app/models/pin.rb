class Pin < ApplicationRecord
  validates_presence_of :description

  belongs_to :user
  has_attached_file :pin_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pin_image, content_type: /\Aimage\/.*\z/

end
