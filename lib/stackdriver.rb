require 'multi_json'

module StackDriver
  POST_URI = "https://custom-gateway.stackdriver.com/v1/custom"
  
  def self.init customer_id, api_key
    @customer_id = customer_id
    @api_key = api_key
  end
  
  def self.send_metric name, value, time
    msg = build_message name, value, time
    post MultiJson.dump(msg)
  end

  private

  def self.post msg
    headers = {'content-type' => 'application/json',
      'x-stackdriver-apikey' => @api_key}

    uri = URI(StackDriver::POST_URI)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    http.start do |http|
      http.post(uri.path, msg.to_json, headers)
    end
  end

  def self.build_message name, value, time
    data_point = {'name' => name, 'value' => value, 'collected_at' => time}
    
    {'timestamp' => Time.now.to_i, 'customer_id' => @customer_id,
      'proto_version' => '1', 'data' => data_point}
  end
end
