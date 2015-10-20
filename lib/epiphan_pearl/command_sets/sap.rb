module EpiphanPearl
  class Sap
    PARAMETERS = {
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
      }
    }

    def self.enabled(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["sap"], value)
    end

    def self.channel_number(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["sap_channel_no"], value)
    end

    def self.group(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["sap_group"], value)
    end

    def self.ip(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["sap_ip"], value)
    end
  end
end
