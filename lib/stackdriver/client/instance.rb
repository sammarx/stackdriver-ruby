module StackDriver
  class Client
    class Instance < StackDriver::Client


      def endpoint
        @endpoint = "#{api_version}/instances"
      end

      def list_metrics(id=id)
        get_endpoint("#{endpoint}/#{id}/metrics/")
      end

      def get_one_metric(metric=metric)
        get_endpoint("#{endpoint}/#{id}/data/#{metric}")
      end


    end
  end
end
