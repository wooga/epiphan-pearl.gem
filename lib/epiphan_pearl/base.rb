require "net/http"
require "uri"

module EpiphanPearl
  class Base
    def self.set(device, parameter, value)
      unless parameter[:value_type].nil?
        unless parameter[:value_type].is_value_type_of?(value)
          raise("Invalid Value Class Exception - should "+
                "be #{parameter[:value_type]}")
        end

        value = value ? "on" : "" if parameter[:value_type].is_boolean?
      end

      value = if parameter[:value_evaluation].nil?
                value
              else
                parameter[:value_evaluation].call(value)
              end

      if !parameter[:possible_values].nil? &&
          !parameter[:possible_values].include?(value)
        raise "Value Not In Approved Possibilities Exception - " +
          "value should be in #{parameter[:possible_values]}"
      end

      params = { parameter[:key] => value.to_s }
      create_request(device, params, true)

      value
    end

    def self.get(device, parameter)
      result = ""

      params = { parameter[:key] => "" }
      response = create_request(device, params, false)
      result = response.body.split('=').last.strip

      result = if parameter[:result_processing]
                 parameter[:result_processing].call result
               else
                 result
               end

      case true
      when parameter[:value_type].nil?        then result
      when parameter[:value_type].is_boolean? then result == "on"
      when parameter[:value_type].is_integer? then result.to_i
      else
        result
      end
    end

    def self.create_request(device, params, is_setter)
      uri = URI.parse(generate_url(device, params, is_setter))
      http = Net::HTTP.new EpiphanPearl.configuration.ip

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth EpiphanPearl.configuration.username, EpiphanPearl.configuration.password

      response = http.request(request)

      raise "Authentication Exception"      if response.code == "401"
      raise "Unknown Device Exception"      if response.code == "404"
      raise "Unknown Parameter Exception"   if response.body.split('Unknown parameter').size > 1

      response
    end

    private

    def self.generate_url(device, params, is_setter)
      params    = params.map{|k,v| "#{CGI.escape k}=#{CGI.escape v}"}.join('&')
      username  = CGI.escape EpiphanPearl.configuration.username
      device    = CGI.escape device

      "http://#{EpiphanPearl.configuration.ip}/#{username}/#{device}"+
        "/#{is_setter ? 'set' : 'get'}_params.cgi?#{params}"
    end
  end
end
