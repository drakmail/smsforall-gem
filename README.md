# Smsforall

Client for smsforall.ru site API (http://www.smsforall.ru/doc/api/)

## Installation

Add this line to your application's Gemfile:

    gem 'smsforall'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smsforall

## Usage

Usage is pretty simple:

    sms = Smsforall::Sms.new("test", "test", :test) #  for test
	# for production:
    # sms = Smsforall::Sms.new("login", "password")
    balance = sms.get_balance()
    message = sms.send_message("sender", "sms text", "79251233232")
    status = sms.get_status(message)
    puts "#{balance}, #{message}, #{status}"

## Command-line client

smsforall-gem also provides command line utility `smsforall`. You may see usage instructions by executing `smsforall -h`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
