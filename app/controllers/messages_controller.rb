class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def five_recent
    @messages = Message.recent_five
  end

  def new
    @message = Message.new
  end

  def destroy
      @message = Message.find params[:id]
      @message.destroy
      redirect_to root_path, notice: "message destroyed"
    end

  def edit
    @message = Message.find(params[:id])
  end

  def create
   @message = Message.new(params.require(:message).
                    permit([:name, :email, :department, :message]))
   if @message.save
     flash[:notice] = "Message saved successfully"
     redirect_to root_path
   else
     flash[:alert] = "Something went wrong. Please refresh and try again."
     render :new
  end
end

def update
    @message = Message.find(params[:id])

    if @message.update(params.require(:message).
                    permit([:name, :email, :department, :message]))
      flash[:notice] = "Message updated successfully"
      redirect_to root_path
    else
      flash[:alert] = "Unable to update message. Please try again."
      render :edit
    end
  end



end
