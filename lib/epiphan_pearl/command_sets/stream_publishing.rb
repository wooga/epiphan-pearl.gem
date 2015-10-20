module EpiphanPearl
  class StreamPublishing < CommandSet
    register_parameters [
      "publish_type" => {
        :key => "publish_type",
        :display_value => "type",
        :possible_values => [*0..8],
        :value_class => [Integer]
      }
    ]
  end
end
