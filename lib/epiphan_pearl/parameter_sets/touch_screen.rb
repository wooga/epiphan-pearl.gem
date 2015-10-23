module EpiphanPearl
  class TouchScreen < ParameterSet
    register_parameters [
      {
        :key             => "touchscreen_backlight",
        :display_name    => "backlight",
        :possible_values => [*0..255],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key          => "touchscreen_enabled",
        :display_name => "enabled",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key          => "touchscreen_info",
        :display_name => "info",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key          => "touchscreen_preview",
        :display_name => "preview",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key          => "touchscreen_recordctrl",
        :display_name => "record_control",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key          => "touchscreen_settings",
        :display_name => "settings",
        :value_type   => EpiphanPearl::Types::Boolean
      },
      {
        :key          => "touchscreen_timeout",
        :display_name => "timeout",
        :value_type   => EpiphanPearl::Types::Integer
      }
    ]

    def initialize
      @device = nil
    end
  end
end
