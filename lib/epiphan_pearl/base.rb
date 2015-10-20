require "net/http"
require "uri"

module EpiphanPearl
  class Base
    def self.set(device, parameter, value)
      result = ""

      if !parameter.nil?
        if !(processed_value = parameter[:value_evaluation].call(value)).nil?
          params = { parameter[:key] => processed_value }
          create_request device, params, true, true

          result = EpiphanPearl::Parameter.get device, key
        else
          @@error = :invalid_value_error
        end
      else
        @@error = :unknown_key_error
      end

      { :value => result, :error => @@error}
    end

    def self.get(device, parameter)
      result = ""

      if !parameter.nil?
        params = { parameter[:key] => "" }
        response = create_request device, params, false, true
        result = parameter[:result_processing].call response.body.split('=').last.strip
      else
        @@error = :unknown_key_error
      end

      { :value => result, :error => @@error }
    end

    def self.toggle(device, parameter, value = nil)
      if !value.nil?
        set(device, parameter, value)
      else
        get(device, parameter)
      end
    end

    def self.create_request(device, params, is_setter, send = false)
      uri = URI.parse(generate_url device, params, is_setter)
      http = Net::HTTP.new EpiphanPearl.configuration.ip

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth EpiphanPearl.configuration.username, EpiphanPearl.configuration.password

      if send
        response = http.request(request)

        raise "EpiphanPearl Gem: Authentication exception"    if response.code == "401"
        raise "EpiphanPearl Gem: Unknown Device Exception"    if response.code == "404"

        @@error = nil
        @@error = :unknown_parameter_error  if response.body.split('Unknown parameter').size > 1

        response
      else
        request
      end
    end
  private
    def self.generate_url(device, params, is_setter)
      params    = URI.escape params.map{|k,v| "#{k}=#{v}"}.join('&')
      username  = URI.escape EpiphanPearl.configuration.username
      device    = URI.escape device
      "http://#{EpiphanPearl.configuration.ip}/#{username}/#{device}/#{is_setter ? 'set' : 'get'}_params.cgi?#{params}"
    end
  end
end
