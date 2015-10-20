module EpiphanPearl
  class Sap < CommandSet
    register_parameters [
      {
        :key => "sap",
        :display_name => "enabled",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "sap_channel_no",
        :display_name => "channel_number",
        :value_class => [Integer]
      },
      {
        :key => "sap_group",
        :display_name => "group"
      },
      {
        :key => "sap_ip",
        :display_name => "ip"
      }
    ]
  end
end
