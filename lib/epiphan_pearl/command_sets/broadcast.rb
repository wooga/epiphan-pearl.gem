module EpiphanPearl
  class Broadcast
    PARAMETERS = {
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
      }
    }

    def self.enabled(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["bcast_disabled"], !value)
    end

    def self.rtsp_port(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["rtsp_port"], value)
    end

    def self.streamport(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["streamport"], value)
    end
  end
end
