class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :content, presence: true

  def created_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
