class Conversation < ApplicationRecord
    belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
    belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
    has_many :messages, dependent: :destroy

    validates_uniqueness_of :sender_id, :scope => :recipient_id

    scope :between, -> (sender_id, recipient_id) do
        where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
    end

    def receiver(current_user)
        self.sender_id == current_user.id ? self.recipient : self.sender
    end

end
