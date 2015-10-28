require "net/http"
require "uri"

module EpiphanPearl
  class Base
    def self.set(device, parameter, value)
      value_type = parameter[:value_type]

      if !value_type.nil? && !value_type.is_value_type_of?(value)
        raise("Invalid Value Class Exception - should "+
              "be #{parameter[:value_type]}")
      end

      if !value_type.nil?
        value = value_type.pre_processing(value)
      end

      value_pre_process = parameter[:value_evaluation]
      value = value_pre_process.nil? ? value : value_pre_process.call(value)

      if !parameter[:possible_values].nil? &&
          !parameter[:possible_values].include?(value)
        raise("Value Not In Approved Possibilities Exception - " +
              "value should be in #{parameter[:possible_values]}")
      end

      params = { parameter[:key] => value.to_s }
      create_request(device, params, true)

      value
    end

    def self.get(device, parameter)
      params   = { parameter[:key] => "" }
      response = create_request(device, params, false)
      result   = response.body.split('=').last.strip

      value_pst_process = parameter[:result_processing]
      result = value_pst_process.nil? ? result : value_pst_process.call(result)

      value_type = parameter[:value_type]
      value_type.nil? ? result : value_type.post_processing(result)
    end

    def self.create_request(device, params, is_setter, uri = nil)
      uri  ||= URI.parse(generate_url(device, params, is_setter))
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
      device    = device.nil? ? "" : "/"+CGI.escape(device)

      "http://#{EpiphanPearl.configuration.ip}/#{username}#{device}"+
        "/#{is_setter ? 'set' : 'get'}_params.cgi?#{params}"
    end
  end
end
