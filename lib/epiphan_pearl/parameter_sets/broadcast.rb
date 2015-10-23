module EpiphanPearl
  class Broadcast < ParameterSet
    register_parameters [
      {
        :key          => "bcast_disabled",
        :display_name => "disabled",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key             => "rtsp_port",
        :possible_values => [*1000..65535] - [5557],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "streamport",
        :display_name    => "stream_port",
        :possible_values => [*1000..65535] - [5557],
        :value_type      => EpiphanPearl::Types::Integer
      }
    ]
  end
end
