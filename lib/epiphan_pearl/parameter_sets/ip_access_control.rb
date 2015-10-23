module EpiphanPearl
  class IpAccessControl < ParameterSet
    register_parameters [
      {
        :key              => "allowips",
        :display_name     => "allowed_ips",
        :value_type       => EpiphanPearl::Types::Array,
      },
      {
        :key              => "denyips",
        :display_name     => "denied_ips",
        :value_type       => EpiphanPearl::Types::Array,
      }
    ]
  end
end
