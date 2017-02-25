class Post < ApplicationRecord
  validates :image, presence: true
  has_attached_file :image, styles: {
    square: '200x200#',
    medium: '640x',
    large: '1080x',
  }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 3.megabytes
end
