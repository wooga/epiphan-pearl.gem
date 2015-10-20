module EpiphanPearl
  class Broadcast < CommandSet
    register_parameters [
      {
        :key => "bcast_disabled",
        :display_name => "disabled",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "rtsp_port",
        :possible_values => [*1000..65535] - [5557],
        :value_class => [Integer]
      },
      {
        :key => "streamport",
        :display_name => "stream_port",
        :possible_values => [*1000..65535] - [5557],
        :value_class => [Integer]
      }
    ]
  end
end
