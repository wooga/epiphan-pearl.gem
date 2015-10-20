module EpiphanPearl
  class Upnp
    PARAMETERS = {
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
      }
    }

    def self.share_archive(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["share_archive"], value)
    end

    def self.share_livestreams(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["share_livestreams"], value)
    end

    def self.server_name(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["server_name"], value)
    end
  end
end
