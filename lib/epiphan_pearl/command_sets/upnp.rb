module EpiphanPearl
  class Upnp < CommandSet
    register_parameters [
      {
        :key => "share_archive",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "share_livestreams",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "server_name",
      }
    ]
  end
end
