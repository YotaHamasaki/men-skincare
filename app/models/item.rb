class Item < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :posts, dependent: :destroy
    
    validates :item, presence: true
end
