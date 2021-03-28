class Item < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :posts, dependent: :destroy
    
    validates :name, presence: true
    validates :image, presence: true
end
