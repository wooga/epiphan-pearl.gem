require "net/http"
require "uri"

module EpiphanPearl
  class Network
    def self.create_request(device, params, is_setter, send = false)
      puts generate_url device, params, is_setter
      uri = URI.parse(generate_url device, params, is_setter)
      http = Net::HTTP.new EpiphanPearl.configuration.ip

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth EpiphanPearl.configuration.username, EpiphanPearl.configuration.password

      if send
        response = http.request(request)

        EpiphanPearl::Error.set(:authentication_error)     if response.code == "401"
        EpiphanPearl::Error.set(:unknown_device_error)     if response.code == "404"
        EpiphanPearl::Error.set(:unknown_parameter_error)  if response.body.split('Unknown parameter').size > 1

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
