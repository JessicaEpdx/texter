class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @contacts = Contact.all
    respond_to do |format|
      format.html {render :index }
      format.js
    end
  end

  def create
    @message = Message.new(message_params)
    @messages = Message.all
    if @message.save
      flash[:notice] = "Your message was sent"
      respond_to do |format|
        format.html {render :index }
        format.js
      end
    else
      flash[:notice] = "Please try again."
      respond_to do |format|
        format.html {render 'index'}
        format.js {render 'error'}
      end
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
