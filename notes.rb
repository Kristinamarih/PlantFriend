PlantFriend

User model
    has_many :products
    has_many :comments
    has_many :products, through :comments
    belongs_to :category
    email
    username
    password_digest

Product model 
    belongs_to :user
    has_many :comments
    has_many :users, through :comments
    belongs_to :category

Comment model * join table
    belongs_to :user
    belongs_to :product
    content

Category model * join table
    has_many :products
    has_many :users, through :products
    name