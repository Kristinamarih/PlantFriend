class Message < ApplicationRecord
    belongs_to :conversation
    belongs_to :user

    validates_presence_of :body, :conversation_id, :user_id
    validates :body, :length => { :maximum => 1000, :minimum => 1 }
    
    def convo_time
      created_at.strftime("%d/%m/%y at %l:%M %p")
    end

    def message_time
      created_at.strftime("%l:%M %p")
    end
end
