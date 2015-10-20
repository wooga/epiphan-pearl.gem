module EpiphanPearl
  class MpegTs
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
      }
    }

    def self.address(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["unicast_address"], value)
    end

    def self.m_port(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["unicast_mport"], value)
    end
  end
end
