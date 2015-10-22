module EpiphanPearl
  class Sap < ParameterSet
    register_parameters [
      {
        :key          => "sap",
        :display_name => "enabled",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key          => "sap_channel_no",
        :display_name => "channel_number",
        :value_type   => EpiphanPearl::Types::Integer
      },
      {
        :key          => "sap_group",
        :display_name => "group"
      },
      {
        :key          => "sap_ip",
        :display_name => "ip"
      }
    ]
  end
end
