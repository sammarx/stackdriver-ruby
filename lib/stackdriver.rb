require 'multi_json'
require_relative 'stackdriver/error'
require_relative 'stackdriver/client'
require_relative 'stackdriver/custom'


module StackDriver
  
  class << self    

    include StackDriver::Custom

    def client
      @client ||= StackDriver::Client.new
    end

# maintain backwards compatability for custom metrics.
    def init api_key
      custom_init api_key
    end

  end
end
