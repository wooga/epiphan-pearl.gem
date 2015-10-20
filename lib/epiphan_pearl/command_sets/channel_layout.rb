module EpiphanPearl
  class ChannelLayout < CommandSet
    register_parameters [
      {
        :key => "active_layout",
        :value_class => [Integer]
      }
    ]
  end
end
