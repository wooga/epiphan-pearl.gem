module EpiphanPearl
  class Audio < ParameterSet
    register_parameters [
      {
        :key => "audio",
        :display_name => "enabled",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "audiobitrate",
        :display_name => "bitrate",
        :possible_values => [32, 64, 96, 112, 128, 160, 192],
        :value_class => [Integer]
      },
      {
        :key => "audiochannels",
        :display_name => "channels",
        :possible_values => [1, 2],
        :value_class => [Integer]
      },
      {
        :key => "audiopreset",
        :display_name => "preset",
        :value_class => [Hash],
        :value_evaluation => Proc.new do |value|
            if ["pcm_s161e", "libmp3lame", "libfacc"].include?(value[:codec]) &&
              [32, 64, 96, 112, 128, 160, 192].include?(value[:bitrate])
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            {:codec => result.split(";")[0], :bitrate => result.split(";")[1].to_i}
          end
      }
    ]
  end
end
