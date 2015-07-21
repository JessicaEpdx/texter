class MessagesController < ApplicationController

  def index
    @messages = Message.all
    respond_to do |format|
      format.html {render :index }
      format.js
    end
  end

  def new
    @messages = Message.all
    @message = Message.new
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
