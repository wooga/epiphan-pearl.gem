module EpiphanPearl
  class IpAccessControl
    PARAMETERS = {
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
      }
    }

    def self.allow_ips(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["allowips"], value)
    end

    def self.deny_ips(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["denyips"], value)
    end
  end
end
