module EpiphanPearl
  class ChannelEncoder < ParameterSet
    register_parameters [
      {
        :key          => "autoframesize",
        :display_name => "auto_frame_size",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key             => "codec",
        :possible_values => ["h.264", "mpeg4", "mjpeg"]
      },
      {
        :key             => "fpslimit",
        :display_name    => "fps_limit",
        :possible_values => [*1..60],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "framesize",
        :display_name    => "frame_size",
        :possible_values => ["640x480", "720x400", "720x480", "720x576",
                             "768x576", "1024x768", "1152x864", "1280x720",
                             "1280x768", "1280x960", "1280x1024", "1360x768",
                             "1360x1024", "1600x1200", "1920x1200",
                             "2048x2048", "2560x1600"]
      },
      {
        :key          => "slicemode",
        :display_name => "slice_mode",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key          => "vbitrate",
        :display_name => "video_bit_rate",
        :value_type   => EpiphanPearl::Types::Integer
      },
      {
        :key             => "vbufmode",
        :display_name    => "video_buffer_mode",
        :possible_values => [1, 2],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "vencpreset",
        :display_name    => "video_encoding_preset",
        :possible_values => [0, 5],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key          => "vkeyframeinterval",
        :display_name => "video_keyframe_interval",
        :value_type   => EpiphanPearl::Types::Integer
      },
      {
        :key             => "vprofile",
        :display_name    => "video_profile",
        :possible_values => [66, 77, 100],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "qvalue",
        :display_name    => "mjpeg_quality",
        :possible_values => [*0..100],
        :value_type      => EpiphanPearl::Types::Integer
      }
    ]
  end
end
