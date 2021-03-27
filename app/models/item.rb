class Item < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :posts, dependent: :destroy
end
