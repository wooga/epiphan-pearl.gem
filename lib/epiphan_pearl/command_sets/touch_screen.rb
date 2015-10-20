module EpiphanPearl
  class TouchScreen < CommandSet
    register_parameters [
      {
        :key => "touchscreen_backlight",
        :display_name => "backlight",
        :possible_values => [*0..255],
        :value_class => [Integer]
      },
      {
        :key => "touchscreen_enabled",
        :display_name => "enabled"
      },
      {
        :key => "touchscreen_info",
        :display_name => "info",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "touchscreen_preview",
        :display_name => "preview",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "touchscreen_recordctrl",
        :display_name => "record_control",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "touchscreen_settings",
        :display_name => "settings",
        :value_class => [TrueClass, FalseClass]
      },
      {
        :key => "touchscreen_timeout",
        :display_name => "timeout",
        :value_class => [Integer]
      }
    ]
  end
end
