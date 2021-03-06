module EpiphanPearl
  class RtspAnnouncement < ParameterSet
    register_parameters [
      {
        :key          => "announce_by_tcp",
        :display_name => "use_tcp",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key          => "announce_host",
        :display_name => "host"
      },
      {
        :key          => "announce_name",
        :display_name => "name"
      },
      {
        :key          => "announce_password",
        :display_name => "password"
      },
      {
        :key             => "announce_port",
        :display_name    => "port",
        :possible_values => [*1000..65535] - [5557],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key          => "announce_username",
        :display_name => "username"
      }
    ]
  end
end
