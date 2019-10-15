class User < ApplicationRecord
    has_many :products, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :commented_products, through: :comments, source: :product
    has_secure_password

    has_many :conversations, :foreign_key => :sender_id
end
