module StackDriver
  class Client
    class Groups < StackDriver::Client

      def endpoint
        @endpoint = "#{api_version}/groups"
      end

    end
  end
end
