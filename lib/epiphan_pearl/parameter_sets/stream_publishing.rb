module EpiphanPearl
  class StreamPublishing < ParameterSet
    register_parameters [
      {
        :key             => "publish_enabled",
        :display_value   => "publish_enabled",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key             => "publish_type",
        :display_value   => "type",
        :possible_values => [*0..8],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "livestream_channel",
        :display_value   => "livestream_channel",
      },
      {
        :key             => "rtsp_url",
        :display_value   => "rtsp_url",
      },
      {
        :key             => "rtmp_url",
        :display_value   => "rtmp_url",
      },
      {
        :key             => "rtmp_stream",
        :display_value   => "rtmp_stream",
      },
      {
        :key             => "rtsp_transport",
        :display_value   => "rtsp_transport",
        :possible_values => ["tcp", "udp", ""]
      },
      {
        :key             => "rtmp_username",
        :display_value   => "username",
      },
      {
        :key             => "rtmp_password",
        :display_value   => "password",
      },
    ]
  end
end
