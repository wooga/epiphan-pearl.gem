module EpiphanPearl
  class FrameGrabber < CommandSet
    register_parameters [
      {
        :key => "gain",
        :possible_values => [*0..255],
        :value_class => [Integer]
      },
      {
        :key => "hshift",
        :display_name => "horizontal_shift",
        :possible_values => [*-999..999],
        :value_class => [Integer]
      },
      {
        :key => "offset",
        :possible_values => [*0..63],
        :value_class => [Integer]
      },
      {
        :key => "phase",
        :possible_values => [*0..31],
        :value_class => [Integer]
      },
      {
        :key => "pll",
        :possible_values => [*-999..999],
        :value_class => [Integer]
      },
      {
        :key => "tune_interval",
        :possible_values => [*0..9999],
        :value_class => [Integer]
      },
      {
        :key => "vshift",
        :display_name => "vertical_shift",
        :possible_values => [*-20..20],
        :value_class => [Integer]
      }
    ]
  end
end
