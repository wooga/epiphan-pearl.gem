require "net/http"
require "uri"

module EpiphanPearl
  class Base
    def self.set(device, parameter, value)
      unless parameter[:value_class].nil?
        raise "Invalid Value Class Exception - should be a #{parameter[:value_class]}" \
          if parameter[:value_class].select { |clazz| value.is_a? clazz }.size == 0

        value = value ? "on" : "" if parameter[:value_class].first == TrueClass
      end

      unless parameter[:value_evaluation].nil?
        value = parameter[:value_evaluation].call value

        raise "Invalid Value Exception" if value == :invalid_value_error
      end

      unless parameter[:possible_values].nil?
        raise "Invalid Value Exception - " +
              "value should be in #{parameter[:possible_values]}" \
              unless parameter[:possible_values].include?(value)
      end

      params = { parameter[:key] => value.to_s }
      create_request device, params, true, true

      value
    end

    def self.get(device, parameter)
      result = ""

      params = { parameter[:key] => "" }
      response = create_request device, params, false, true
      result = response.body.split('=').last.strip

      result = parameter[:result_processing].call result unless parameter[:result_processing].nil?

      unless parameter[:value_class].nil?
        result = result == "on" if parameter[:value_class].first == TrueClass
        result = result.to_i    if parameter[:value_class].first == Integer
      end

      result
    end

    def self.create_request(device, params, is_setter, send = false)
      uri = URI.parse(generate_url device, params, is_setter)
      http = Net::HTTP.new EpiphanPearl.configuration.ip

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth EpiphanPearl.configuration.username, EpiphanPearl.configuration.password

      if send
        response = http.request(request)

        raise "Authentication Exception"      if response.code == "401"
        raise "Unknown Device Exception"      if response.code == "404"
        raise "Unknown Parameter Exception"   if response.body.split('Unknown parameter').size > 1

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
