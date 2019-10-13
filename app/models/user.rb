class User < ApplicationRecord
    has_many :products
    has_many :comments
    has_many :commented_products, through: :comments, source: :product
end
