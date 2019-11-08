class User < ApplicationRecord
    has_many :products, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :commented_products, through: :comments, source: :product
    has_many :conversations, :foreign_key => :sender_id
    has_secure_password

    validates :email, :username, :password, :presence => true
    validates :email, :username, :uniqueness => true
    validates :password, :length => { :in => 6..20 }
end
