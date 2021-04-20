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
    
       def post_score_percentage
        unless self.posts.empty?
            posts.average(:rate).round(0.5).to_f*100/5
        else
            0.0
        end
    end
    
    validates :name, presence: true
    validates :image, presence: true
end
