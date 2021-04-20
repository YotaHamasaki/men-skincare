class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true, dependent: :destroy
  
      def avg_rate
        unless posts.empty?
            posts.average(:rate).round(0.5).to_f
        else
            0.0
        end
    end
  
    validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5 },allow_blank: true
    validates :rate, presence: true
    validates :title,length: {maximum: 20}, presence: true
    validates :content,length: {maximum: 300},  presence: true
    validates :user_id, presence: true
end

