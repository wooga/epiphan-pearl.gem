require "net/http"
require "uri"

module EpiphanPearl
  class Pearl

    @@error = nil
    @@new_error = false

    def self.error
      begin
        @@error
      ensure
        @@new_error = false
        @@error = nil
      end
    end

    def self.set_recording(device, recording, prefix = nil)
      params = {
        "rec_enabled" => recording ? "on" : ""
        }
      params["rec_prefix"] = prefix if !prefix.nil?

      url = setter_url(device, params)
      create_request url, true

      @@new_error ? @@new_error = false : recording == recording?(device)
    end

    def self.recording?(device)
      url = getter_url device, ["rec_enabled"]
      response = create_request url, true
      response.body.split('=')[1].nil? ? false : response.body.split('=')[1].strip == "on"
    end

    def self.create_request(url, send = false)
      uri = URI.parse url
      http = Net::HTTP.new EpiphanPearl.configuration.ip

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth EpiphanPearl.configuration.username, EpiphanPearl.configuration.password

      if send
        response = http.request(request)

        error = :authentication_error     if response.code == "401"
        error = :unknown_device_error     if response.code == "404"
        error = :unknown_parameter_error  if response.body.split('Unknown parameter').size > 1

        if !error.nil?
          @@new_error = true
          @@error = error
        end

        response
      else
        request
      end
    end

    def self.getter_url(device, params)
      params = params.join('&')
      "http://#{EpiphanPearl.configuration.ip}/#{EpiphanPearl.configuration.username}/#{device}/get_params.cgi?#{params}"
    end

    def self.setter_url(device, params)
      params = params.map{|k,v| "#{k}=#{v}"}.join('&')
      "http://#{EpiphanPearl.configuration.ip}/#{EpiphanPearl.configuration.username}/#{device}/set_params.cgi?#{params}"
    end
  end
end
