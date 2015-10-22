module EpiphanPearl
  class FrameGrabber < ParameterSet
    register_parameters [
      {
        :key             => "gain",
        :possible_values => [*0..255],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "hshift",
        :display_name    => "horizontal_shift",
        :possible_values => [*-999..999],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "offset",
        :possible_values => [*0..63],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "phase",
        :possible_values => [*0..31],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "pll",
        :possible_values => [*-999..999],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "tune_interval",
        :possible_values => [*0..9999],
        :value_type      => EpiphanPearl::Types::Integer
      },
      {
        :key             => "vshift",
        :display_name    => "vertical_shift",
        :possible_values => [*-20..20],
        :value_type      => EpiphanPearl::Types::Integer
      }
    ]
  end
end
