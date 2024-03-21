class Category < ApplicationRecord
    ##add associations with the post model
    has_many :posts
    ##create  a migration to add category_id to the posts table 
end
