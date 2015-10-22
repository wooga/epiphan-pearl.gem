module EpiphanPearl
  class Upnp < ParameterSet
    register_parameters [
      {
        :key        => "share_archive",
        :value_type => EpiphanPearl::Types::Boolean
      },
      {
        :key        => "share_livestreams",
        :value_type => EpiphanPearl::Types::Boolean
      },
      {
        :key => "server_name",
      }
    ]
  end
end
