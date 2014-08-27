module StackDriver
  class Client
    class Users < StackDriver::Client

      def endpoint
        @endpoint = "#{api_version}/users"
      end

    end
  end
end
