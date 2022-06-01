class Article < ApplicationRecord
  
  belongs_to :user, optional: true
  
  has_one_attached :image
  
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no-image-icon.jpeg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image
  end
  
end
