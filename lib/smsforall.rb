require "smsforall/version"
require 'net/http'
require 'cgi'
require 'digest'
require 'json'

# Main module for Smsforall API class
module Smsforall
  # Class for interaction with smsforall.ru API
  class Sms
    attr_reader :username, :password, :api

    # Initialize Sms-API class. For testing purporoses set mode to :test
    def initialize(username, password, mode=:production)
      @username = username
      @password = Digest::MD5.hexdigest(password)
      modes = {:production => "/api/", :test => "/testapi/"}
      @api = modes[mode]
    end

    # Return user balance
    def get_balance()
      do_request("balance", {})["balance"]
    end

    # Send message
    def send_message(sender,text,msisdn)
      do_request("send", { :msisdn => msisdn, :sender => sender, :text => text })["transactionid"]
    end
    
    # Get status of transaction
    def get_status(transactionid)
      do_request("status", { :transactionid => transactionid })
    end

    private
    # Simple HTTP GET request wrapper
    def http_get(domain,path,params)
      return Net::HTTP.get(domain, "#{path}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&'))) if not params.nil?
      return Net::HTTP.get(domain, path)
    end

    # Convert hash to inner signature format
    def to_signature(parameters)
      parameters.map{|k,v| "#{v}"}.join('')
    end
    
    # Send request to smsforall
    def do_request(action,parameters)
      request_parameters = { :action => action, :login => @username}.merge(parameters)
      signature = Digest::MD5.hexdigest( to_signature( request_parameters.merge({:password => @password}) ) )
      request_parameters["signature"] = signature
      result = JSON.parse(http_get("www.smsforall.ru",@api,request_parameters.merge(parameters) ))
    end
  end
end
