require 'multi_json'


module StackDriver
  module Custom
    attr_accessor :api_key
    
    POST_URI = "https://custom-gateway.stackdriver.com/v1/custom"
    DELETE_URI = "https://custom-gateway.stackdriver.com/v1/delete_custom"

    def custom_init api_key
      @api_key = api_key
    end

    def send_metric name, value, time, instance=''
      msg = build_message name, value, time, instance
      post MultiJson.dump(msg), StackDriver::Custom::POST_URI
    end

    def delete_metric name, time
      msg = build_message name, nil, time
      post MultiJson.dump(msg), StackDriver::Custom::DELETE_URI
    end

    def post msg, uri
      headers = {'content-type' => 'application/json',
        'x-stackdriver-apikey' => api_key}

        puts api_key
      uri = URI(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      http.start do |http|
        response = http.post(uri.path, msg, headers)
        if response.code != "201"
          raise RuntimeError, "#{response.code} - #{response.body}"
        else
          return true
        end
      end
    end

    def build_message name, value, time, instance=''
      data_point = {'name' => name, 'value' => value, 'collected_at' => time}
      data_point.merge!('value' => value) unless value.nil?
      data_point.merge!('instance' => instance) unless instance.empty?
      {'timestamp' => Time.now.to_i, 'proto_version' => '1', 'data' => data_point}
    end
  end
end

