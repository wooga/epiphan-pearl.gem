
    #http://<address>/admin/recorder1/set_params.cgi?rec_prefix=eventId&rec_enabled=on
    #http://<address>/admin/recorder1/set_params.cgi?rec_enabled=
    #http://<address>/admin/recorder1/get_params.cgi?rec_enabled
    #user admin
    #passwort

require "net/http"
require "uri"

module EpiphanPearlGem
  class Pearl
    attr_accessor :ip, :username, :password

    def initialize(ip = "0.0.0.0", username = "admin", password = "")
      @ip = ip
      @username = username
      @password = password
    end

    def start_recording(device, prefix = "")
      url = setter_url(device, {
        "rec_prefix" => prefix,
        "rec_enabled" => "on"
        })
      create_request url, true

      recording? device
    end

    def stop_recording(device)
      url = setter_url(device, {
        "rec_enabled" => ""
        })
      create_request url, true

      recording? device
    end

    def recording?(device)
      url = getter_url device, ["rec_enabled"]
      response = create_request url, true
      response.body.split('=')[1].strip == "on"
    end

    def create_request(url, send = false)
      uri = URI.parse url
      http = Net::HTTP.new ip

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth username, password

      if send
        response = http.request(request)

        raise "Epiphan Pearl Authentication Exception" if response.code == "401"
        raise "Epiphan Pearl Unknown Parameter Exception" if response.body.split('Unknown parameter').size > 1

        response
      else
        request
      end
    end

    def getter_url(device, params)
      params = params.join('&')
      "http://#{@ip}/#{@username}/#{device}/get_params.cgi?#{params}"
    end

    def setter_url(device, params)
      params = params.map{|k,v| "#{k}=#{v}"}.join('&')
      "http://#{@ip}/#{@username}/#{device}/set_params.cgi?#{params}"
    end
  end
end
