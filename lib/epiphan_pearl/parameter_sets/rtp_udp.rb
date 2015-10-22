module EpiphanPearl
  class RtpUdp < ParameterSet
    register_parameters [
      {
        :key          => "unicast_address",
        :display_name => "address"
      },
      {
        :key             => "unicast_aport",
        :display_name    => "audio_port",
        :possible_values => [*1000..65535] - [5557],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "unicast_vport",
        :display_name    => "video_port",
        :possible_values => [*1000..65535] - [5557],
        :value_type      => EpiphanPearl::Types::Integer
      }
    ]
  end
end
