module EpiphanPearl
  class Audio
    PARAMETERS = {
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
      }
    }

    def self.enabled(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["audio"], value)
    end

    def self.bitrate(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["audiobitrate"], value)
    end

    def self.channels(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["audiochannels"], value)
    end

    def self.preset(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["audiopreset"], value)
    end
  end
end
