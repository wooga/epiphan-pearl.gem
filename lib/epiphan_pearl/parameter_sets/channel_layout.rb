module EpiphanPearl
  class ChannelLayout < ParameterSet
    register_parameters [
      {
        :key => "active_layout",
        :value_class => [Integer]
      }
    ]
  end
end
