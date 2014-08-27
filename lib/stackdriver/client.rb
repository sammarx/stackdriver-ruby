# require ''
require 'faraday'
require 'rest_client'
require 'map'
require_relative 'client/policies'
require_relative 'client/groups'
require_relative 'client/instance'
require_relative 'client/users'

module StackDriver
  class Client
    attr_accessor :api_key, :url, :id, :resource_hash, :name, :endpoint, :list

    def api_version
      "v0.2"
    end

    def initialize(name=nil)
      #TODO : move this to config
      @api_key = '8DJZ32GJPPZJYU9AE5TQO2TRN2FWWF8K'
      @url = 'https://api.stackdriver.com/'
      if name
        @resource_hash = get_one(name)
        @id = resource_hash.id
      end
    end

    def list(force=false)
      if force == true
        @list = get_endpoint(endpoint)
      else
        @list ||= get_endpoint(endpoint)
      end
    end

    def create(create_hash)
    end

    def get_one(id_or_name)
      begin
        resource = get_endpoint("#{endpoint}/#{id_or_name}/")
      rescue Error
        resource = get_endpoint(resolve(id_or_name).first)
      end
      pp resource
      self.id = resource.id
      resource
    end

    def maintenance?
      response = get_endpoint("#{endpoint}/#{id}/maintenance/")
      if response.is_a?(Array)
        return response.first.maintenance
      end
      response.maintenance
    end

    def enable_maintenance
      put_rest("#{endpoint}/#{id}/maintenance/", {"maintenance" => "true"}.to_json)
    end

    def disable_maintenance
      put_rest("#{endpoint}/#{id}/maintenance/", {"maintenance" => "false"}.to_json)
    end

    def maintenance_endpoint
      @maintenance_endpoint = "#{api_version}/alerting/maintenance"
    end

    def list_resources_in_maintenance
      get_endpoint("#{maintenance_endpoint}/resources/")
    end

    def list_policies_in_maintenance
      get_endpoint("#{maintenance_endpoint}/policies/")
    end

    def update(id)
    end

    def delete
      delete_rest("#{endpoint}/#{id}")
    end



    private

    def resolve(name)
      r = self.post_rest("v0.2/resolve/",{"name"=> name}.to_json, :content_type => "application/json")
      response=Map.new(JSON.parse(r))
      response.data.map(&:resource)
    end

    def get_endpoint(endpoint)
      endpoint[-1] == '/' ? endpoint : endpoint + "/"
      @ret ||= Map.new
      r=Map.new(JSON.parse(self.get_rest(endpoint)))
      if r.meta.count == 0
        @ret = r.data #unless r.empty?
      else
        @ret = @ret + r.data unless r.data.count < 1
        get_endpoint(r.meta.next) unless r.empty?
      end
      @ret
      # @ret.compact
    end

    def rest
      @rest||=RestClient::Resource.new(URI.escape(url), :headers => {'x-stackdriver-apikey' => api_key})
    end

    %w(get delete).each do |verb|
      define_method("#{verb}_rest") do |path|
        begin
          rest[URI.escape(path)].send(verb)
        rescue RestClient::Exception => e
          raise_error(e)
        end
      end
    end

    %w(post put).each do |verb|
      define_method("#{verb}_rest") do |path, content, opts={:content_type => "application/json"}|
        begin
          rest[URI.escape(path)].send(verb, content, opts)
        rescue RestClient::Exception => e
          raise_error(e)
        end
      end
    end


    def raise_error(e)
      if e.is_a? RestClient::ResourceNotFound
        raise NotFoundError.new(e)
      else
        raise Error.new(e)
      end
    end

  end
end
