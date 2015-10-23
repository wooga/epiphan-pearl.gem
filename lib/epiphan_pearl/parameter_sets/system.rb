module EpiphanPearl
  class System < ParameterSet
    register_parameters [
      {
        :key      => "firmware_version",
        :readonly => true
      },
      {
        :key      => "mac_address",
        :readonly => true
      },
      {
        :key      => "product_name",
        :readonly => true
      },
      {
        :key      => "vendor",
        :readonly => true
      },
      {
        :key          => "frmcheck_enabled",
        :display_name => "firmware_check_enabled",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key => "description",
      }
    ]

    def initialize
      @device = nil
    end
  end
end
