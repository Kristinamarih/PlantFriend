class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  scope :created, -> { order(:created_at)}
  scope :most_comments, -> {joins(:comments).group('products.id').order('count(products.id) desc')}

  def category_attributes(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end

  def created_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end