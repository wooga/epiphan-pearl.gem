module EpiphanPearl
  class MpegTs < ParameterSet
    register_parameters [
      {
        :key          => "unicast_address",
        :display_name => "address"
      },
      {
        :key             => "unicast_mport",
        :display_name    => "mpeg_port",
        :possible_values => [*1000..65535] - [5557],
        :value_type      => EpiphanPearl::Types::Integer
      }
    ]
  end
end
