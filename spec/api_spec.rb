require 'spec_helper'

describe Smsforall do
  
  before(:all) do
    @sms = Smsforall::Sms.new("test","test", :test)
  end

  it "get balance" do
    balance = @sms.get_balance()
    balance.should have_at_least(3).characters
  end
  
  it "send message" do
    message = @sms.send_message("sender", "sms text", "79251233232")
    message.should have_at_least(1).characters
  end
  
  it "get status" do
    status = @sms.get_status("12345678")
    status.should have(1).item
  end
  
  it "raises exception if sender name longer that 11 symbols" do
    expect { @sms.send_message("123somenicer", "some test", "79251233232") }.to raise_error
  end

end
