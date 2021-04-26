class Item < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :posts, dependent: :destroy
    belongs_to :category, optional: true
    
    def avg_rate
        unless self.posts.empty?
            posts.average(:rate).round(0.5).to_f
        else
            0.0
        end
    end
    
    def self.search(search) 
     if search
       where(['name LIKE ?', "%#{search}%"])
    else
       all 
     
    end
 end
    
    validates :name, presence: true
    validates :image, presence: true
    validates :maker, presence: true
    validates :category_id, presence: true
    # validates :category_name, presence: true
end
