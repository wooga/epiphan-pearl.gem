module EpiphanPearl
  class Recording < ParameterSet
    register_parameters [
      {
        :key => "rec_enabled",
        :display_name => "enabled",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "rec_format",
        :display_name => "format",
        :possible_values => ["avi", "mov", "mp4", "ts"]
      },
      {
        :key => "rec_prefix",
        :display_name => "prefix"
      },
      {
        :key => "rec_sizelimit",
        :display_name => "size_limit",
        :value_class => [Integer]
      },
      {
        :key => "rec_timelimit",
        :display_name => "time_limit",
        :value_class => [Integer]
      }
    ]
  end
end
