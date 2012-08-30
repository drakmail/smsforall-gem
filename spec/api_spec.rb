require 'spec_helper'

describe Smsforall do
  sms = Smsforall::Sms.new("test","test", :test)
  balance = sms.get_balance()
  message = sms.send_message("sender", "sms text", "79251233232")
  status = sms.get_status(message)
  puts "#{balance}, #{message}, #{status}"
end
