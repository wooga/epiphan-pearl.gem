require 'json'

module EpiphanPearl
  class System < ParameterSet
    register_parameters [
      {
        :key      => "firmware_version",
        :readonly => true
      },
      {
        :key      => "mac_address",
        :readonly => true
      },
      {
        :key      => "product_name",
        :readonly => true
      },
      {
        :key      => "vendor",
        :readonly => true
      },
      {
        :key          => "frmcheck_enabled",
        :display_name => "firmware_check_enabled",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key => "description",
      }
    ]

    def initialize
      @device = nil
    end

    def channel_statuses
      uri = URI.parse("http://#{EpiphanPearl.configuration.ip}" +
                      "/ajax/channels_status.cgi")
      response = EpiphanPearl::Base.create_request nil, nil, false, uri

      key_replacements = {
        'ageoflastpacket' => :last_package_age,
        'nosignal'        => :no_signal,
        'actualbitrate'   => :bitrate,
        'actualframerate' => :framerate
      }
      JSON.parse(response.body).map do |channel_id, info|
        info.keys.each do |key|
          info[key_replacements[key] || key.to_sym] = info.delete(key)
        end
        info[:channel_id] = channel_id
        info
      end
    end

    def load
      # takes a few seconds because website has to be parsed
      uri = URI.parse("http://#{EpiphanPearl.configuration.ip}" +
                      "/admin/infocfg")
      response = EpiphanPearl::Base.create_request nil, nil, false, uri
      system_load = response.body.scan(/Overall system load:\s*(\d+)/).first.first
      system_load.to_f / 100
    end
  end
end
