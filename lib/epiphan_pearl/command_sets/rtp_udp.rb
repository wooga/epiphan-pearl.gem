module EpiphanPearl
  class RtpUdp
    PARAMETERS = {
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
      }
    }

    def self.address(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["unicast_address"], value)
    end

    def self.a_port(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["unicast_aport"], value)
    end

    def self.v_port(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["unicast_vport"], value)
    end
  end
end
