module EpiphanPearl
  class Parameter
    def self.set(device, key, value)
      command = @@commands[key]
      result = ""

      if !command.nil?
        if !(processed_value = command[:value_evaluation].call(value)).nil?
          params = { command[:key] => processed_value }
          EpiphanPearl::Network.create_request device, params, true, true

          result = EpiphanPearl::Parameter.get device, key
        else
          EpiphanPearl::Error.set :unknown_value_error
        end
      else
        EpiphanPearl::Error.set :unknown_key_error
      end

      EpiphanPearl::Error.new_error ? false : result == value
    end

    def self.get(device, key)
      command = @@commands[key]
      result = ""

      if !command.nil?
        params = { command[:key] => "" }
        response = EpiphanPearl::Network.create_request device, params, false, true
        result = command[:result_processing].call response.body.split('=').last.strip
      else
        EpiphanPearl::Error.set :unknown_key_error
      end

      EpiphanPearl::Error.new_error ? false : result
    end

    @@commands = {
      # System-level settings keys (read-only)
      "firmware_version" => {
        :key => "firmware_version",
        :value_evaluation => Proc.new do |value|
            nil
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "mac_address" => {
        :key => "mac_address",
        :value_evaluation => Proc.new do |value|
            nil
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "product_name" => {
        :key => "product_name",
        :value_evaluation => Proc.new do |value|
            nil
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "vendor" => {
        :key => "vendor",
        :value_evaluation => Proc.new do |value|
            nil
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      # System-level settings keys
      "frmcheck_enabled" => {
        :key => "frmcheck_enabled",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "description" => {
        :key => "description",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      # Touch screen settings keys
      "touchscreen_backlight" => {
        :key => "touchscreen_backlight",
        :value_evaluation => Proc.new do |value|
            if [*0..255].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "touchscreen_enabled" => {
        :key => "touchscreen_enabled",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "touchscreen_info" => {
        :key => "touchscreen_info",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "touchscreen_preview" => {
        :key => "touchscreen_preview",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "touchscreen_recordctrl" => {
        :key => "touchscreen_recordctrl",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "touchscreen_settings" => {
        :key => "touchscreen_settings",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "touchscreen_timeout" => {
        :key => "touchscreen_timeout",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Integer) ? value : nil
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      # Recording configuration keys
      "rec_enabled" => {
        :key => "rec_enabled",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "rec_format" => {
        :key => "rec_format",
        :value_evaluation => Proc.new do |value|
            if ["avi", "mov", "mp4", "ts"].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "rec_prefix" => {
        :key => "rec_prefix",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "rec_sizelimit" => {
        :key => "rec_sizelimit",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Integer) ? value : nil
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "rec_timelimit" => {
        :key => "rec_timelimit",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Integer) ? value : nil
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      # HTTP server configuration keys
      "http_port" => {
        :key => "http_port",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "http_sport" => {
        :key => "http_sport",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "http_usessl" => {
        :key => "http_usessl",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      # IP-based access control configuration keys
      "allowips" => {
        :key => "allowips",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Array) ? value.join(",") : nil
          end,
        :result_processing => Proc.new do |result|
            result.split ","
          end
      },
      "denyips" => {
        :key => "denyips",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Array) ? value.join(",") : nil
          end,
        :result_processing => Proc.new do |result|
            result.split ","
          end
      },
      # UPnP configuration keys
      "share_archive" => {
        :key => "share_archive",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "share_livestreams" => {
        :key => "share_livestreams",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "server_name" => {
        :key => "server_name",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      # SAP configuration keys
      "sap" => {
        :key => "sap",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "sap_channel_no" => {
        :key => "sap_channel_no",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Integer) ? value : nil
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "sap_group" => {
        :key => "sap_group",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "sap_ip" => {
        :key => "sap_ip",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      # Frame grabber configuration keys
      "gain" => {
        :key => "gain",
        :value_evaluation => Proc.new do |value|
            if [*0..255].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "hshift" => {
        :key => "hshift",
        :value_evaluation => Proc.new do |value|
            if [*-999..999].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "offset" => {
        :key => "offset",
        :value_evaluation => Proc.new do |value|
            if [*0..63].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "phase" => {
        :key => "phase",
        :value_evaluation => Proc.new do |value|
            if [*0..31].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "pll" => {
        :key => "pll",
        :value_evaluation => Proc.new do |value|
            if [*-999..999].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "tune_interval" => {
        :key => "tune_interval",
        :value_evaluation => Proc.new do |value|
            if [*0..9999].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "vshift" => {
        :key => "vshift",
        :value_evaluation => Proc.new do |value|
            if [*-20..20].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      # Broadcast configuration keys
      "bcast_disabled" => {
        :key => "bcast_disabled",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "rtsp_port" => {
        :key => "rtsp_port",
        :value_evaluation => Proc.new do |value|
            if ([*1000..65535] - [5557]).include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "streamport" => {
        :key => "streamport",
        :value_evaluation => Proc.new do |value|
            if ([*1000..65535] - [5557]).include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      # Channel encoder configuration keys
      "autoframesize" => {
        :key => "autoframesize",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "codec" => {
        :key => "codec",
        :value_evaluation => Proc.new do |value|
            if ["h.264", "mpeg4", "mjpeg"].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "fpslimit" => {
        :key => "fpslimit",
        :value_evaluation => Proc.new do |value|
            if [*1..60].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "framesize" => {
        :key => "framesize",
        :value_evaluation => Proc.new do |value|
            if ["640x480", "720x400", "720x480", "720x576", "768x576", "1024x768", "1152x864", "1280x720", "1280x768", "1280x960", "1280x1024", "1360x768", "1360x1024", "1600x1200", "1920x1200", "2048x2048", "2560x1600"].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "slicemode" => {
        :key => "slicemode",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "vbitrate" => {
        :key => "vbitrate",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "vbufmode" => {
        :key => "vbufmode",
        :value_evaluation => Proc.new do |value|
            if [1, 2].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "vencpreset" => {
        :key => "vencpreset",
        :value_evaluation => Proc.new do |value|
            if [0, 5].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "vkeyframeinterval" => {
        :key => "vkeyframeinterval",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Integer) ? value : nil
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "vprofile" => {
        :key => "vprofile",
        :value_evaluation => Proc.new do |value|
            if [66, 77, 100].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "qvalue" => {
        :key => "qvalue",
        :value_evaluation => Proc.new do |value|
            if [*0..100].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      # Channel layout configuration keys
      "active_layout" => {
        :key => "active_layout",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Integer) ? value : nil
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      # Audio configuration keys
      "audio" => {
        :key => "audio",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "audiobitrate" => {
        :key => "audiobitrate",
        :value_evaluation => Proc.new do |value|
            if [32, 64, 96, 112, 128, 160, 192].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "audiochannels" => {
        :key => "audiochannels",
        :value_evaluation => Proc.new do |value|
            if [1, 2].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "audiopreset" => {
        :key => "audiopreset",
        :value_evaluation => Proc.new do |value|
            parts = value.split(";")
            if value.is_a?(Hash)
              if ["pcm_s161e", "libmp3lame", "libfacc"].include?(value[:codec]) && [32, 64, 96, 112, 128, 160, 192].include?(value[:bitrate])
                value
              else
                nil
              end
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            {:codec => result.split(";")[0], :bitrate => result.split(";")[1].to_i}
          end
      },
      # Stream publishing configuration keys
      "publish_type" => {
        :key => "publish_type",
        :value_evaluation => Proc.new do |value|
            if [*0..8].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      # RTSP announce configuration keys (Publish type 2)
      "announce_by_tcp" => {
        :key => "announce_by_tcp",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "announce_host" => {
        :key => "announce_host",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "announce_name" => {
        :key => "announce_name",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "announce_password" => {
        :key => "announce_password",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "announce_port" => {
        :key => "announce_port",
        :value_evaluation => Proc.new do |value|
            if ([*1000..65535] - [5557]).include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "announce_username" => {
        :key => "announce_username",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      # RTP/UDP configuration keys (Publish type 3)
      "unicast_address" => {
        :key => "unicast_address",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "unicast_aport" => {
        :key => "unicast_aport",
        :value_evaluation => Proc.new do |value|
            if ([*1000..65535] - [5557]).include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "unicast_vport" => {
        :key => "unicast_vport",
        :value_evaluation => Proc.new do |value|
            if ([*1000..65535] - [5557]).include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      # MPEG-TS configuration keys (Publish types 4 and 5)
      # for unicast_address see above
      "unicast_mport" => {
        :key => "unicast_mport",
        :value_evaluation => Proc.new do |value|
            if ([*1000..65535] - [5557]).include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      # RTMP push configuration keys (Publish type 6)
      # for announce_host see above
      # for announce_name see above
      # for announce_password see above
      # for announce_port see above
      # for announce_username see above

      # Content metadata configuration keys
      "author" => {
        :key => "author",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "comment" => {
        :key => "comment",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "copyright" => {
        :key => "copyright",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "title" => {
        :key => "title",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      }
    }
  end
end
