module EpiphanPearl
  class RtspAnnouncement
    PARAMETERS = {
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
      }
    }

    def self.use_tcp(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["announce_by_tcp"], value)
    end

    def self.host(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["announce_host"], value)
    end

    def self.name(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["announce_name"], value)
    end

    def self.password(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["announce_password"], value)
    end

    def self.port(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["announce_port"], value)
    end

    def self.username(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["announce_username"], value)
    end
  end
end
