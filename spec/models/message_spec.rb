require 'spec_helper'

describe 'Message' do
  it "doesn't save the message if twilio gives error" do
    message = Message.new(:body => "Hi", :to => "111111", :from => "9785138113")
    message.save.should be_false
  end
end
