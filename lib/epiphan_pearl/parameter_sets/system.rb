module EpiphanPearl
  class System < ParameterSet
    register_parameters [
      {
        :key => "firmware_version",
        :value_evaluation => Proc.new do |value|
            :invalid_value_error
          end
      },
      {
        :key => "mac_address",
        :value_evaluation => Proc.new do |value|
            :invalid_value_error
          end
      },
      {
        :key => "product_name",
        :value_evaluation => Proc.new do |value|
            :invalid_value_error
          end
      },
      {
        :key => "vendor",
        :value_evaluation => Proc.new do |value|
            :invalid_value_error
          end
      },
      {
        :key => "frmcheck_enabled",
        :display_name => "firmware_check_enabled",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "description"
      }
    ]
  end
end
