class Post < ApplicationRecord
    belongs_to :category
    has_many :comments
    has_one_attached :image
    validates :title, presence: true, length: {minimum: 1, maximum: 100}
    validates :body, presence: true
end
