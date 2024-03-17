class Post < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true, length: {minimum: 1, maximum: 30}
    validates :body, presence: true
end
