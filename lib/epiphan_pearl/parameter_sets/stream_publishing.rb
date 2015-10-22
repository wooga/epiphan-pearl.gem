module EpiphanPearl
  class StreamPublishing < ParameterSet
    register_parameters [
      {
        :key             => "publish_type",
        :display_value   => "type",
        :possible_values => [*0..8],
        :value_type      => EpiphanPearl::Types::Integer
      }
    ]
  end
end
