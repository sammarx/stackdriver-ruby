module StackDriver
  class Client
    class Policies < StackDriver::Client

      def endpoint
        @endpoint = "#{api_version}/alerting/policies"
      end



      # def list_policies
      #   get_endpoint("#{endpoint}/policies/")
      # end
      #
      # def list_policy_maintenance_status(policy_id)
      #   get_endpoint("#{endpoint}/#{policy_id}/maintenance/")
      # end
      #
      # def get_one_policy(policy_id)
      #   get_endpoint("#{endpoint}/policies/#{policy_id}/")
      # end


    end
  end
end
