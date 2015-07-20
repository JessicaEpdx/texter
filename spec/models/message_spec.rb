require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives error" do
    message = Message.new(:body => "Hi", :to => "111111", :from => "9785138113")
    message.save.should be false
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => "Hi", :to => "111111", :from => "9785138113")
    message.save
    message.errors[:base][0].should eq "The 'To' number 111111 is not a valid phone number."
  end
end
