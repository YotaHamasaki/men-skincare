class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item
  
    validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5 },allow_blank: true
    validates :rate, presence: true
    validates :title,length: {maximum: 20}, presence: true
    validates :content,length: {maximum: 300},  presence: true
end

