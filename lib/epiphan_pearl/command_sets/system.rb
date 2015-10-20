module EpiphanPearl
  class System
    PARAMETERS = {
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
      }
    }

    def self.firmware_version(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["firmware_version"], value)
    end

    def self.mac_address(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["mac_address"], value)
    end

    def self.product_name(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["product_name"], value)
    end

    def self.vendor(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["vendor"], value)
    end

    def self.firmware_check_enabled(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["frmcheck_enabled"], value)
    end

    def self.description(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["description"], value)
    end
  end
end
