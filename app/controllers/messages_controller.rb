class MessagesController < ApplicationController

    def index
        @conversation = Conversation.find(params[:conversation_id])
        @messages = @conversation.messages
        if @messages.length > 10
            @over_ten = true
            @messages = @messages[-10..-1]
        end
        if params[:m]
            @over_ten = false
            @messages = @conversation.messages
        end
        if @messages.last
            if @messages.last.user_id != current_user.id 
                @messages.last.read = true;
            end
        end
        @messages = @conversation.messages.new
    end

    def new
        @conversation = Conversation.find(params[:conversation_id])
        @message = @conversation.messages.new(message_params)
        if @message.save
            redirect_to conversation_messages_path(@conversation)
        end
    end

    private
    
    def message_params
        params.require(:message).permit(:body, :user_id)
    end
end
