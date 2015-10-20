module EpiphanPearl
  class ChannelEncoder
    PARAMETERS = {
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
      }
    }

    def self.auto_frame_size(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["autoframesize"], value)
    end

    def self.codec(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["codec"], value)
    end

    def self.fps_limit(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["fpslimit"], value)
    end

    def self.frame_size(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["framesize"], value)
    end

    def self.slice_mode(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["slicemode"], value)
    end

    def self.bitrate(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["bitrate"], value)
    end

    def self.buffer_mode(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["vbufmode"], value)
    end

    def self.encoder_preset(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["vencpreset"], value)
    end

    def self.keyframe_interval(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["vkeyframeinterval"], value)
    end

    def self.profile(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["vprofile"], value)
    end

    def self.qvalue(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["qvalue"], value)
    end
  end
end
