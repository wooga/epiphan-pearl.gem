module EpiphanPearl
  class StreamPublishing < ParameterSet
    register_parameters [
      {
        :key             => "publish_type",
        :display_value   => "type",
        :possible_values => [*0..8],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "rtsp_url",
        :display_value   => "url",
      },
      {
        :key             => "rtsp_transport",
        :display_value   => "transport",
        :possible_values => ["tcp", "udp", ""]
      },
      {
        :key             => "rtmp_username",
        :display_value   => "username",
      },
      {
        :key             => "rtmp_password",
        :display_value   => "password",
      }
    ]
  end
end
