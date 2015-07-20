class Message < ActiveRecord::Base

  before_creation :send_sms

  private
  def send_sms
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC086308dbfa2abb9e6b4c0c5cc4c2d467'
      :user => 'AC086308dbfa2abb9e6b4c0c5cc4c2d467'
      :password => 'b2f3b401690e128eeea9e716f0d64c8b'
    )
  end

end
