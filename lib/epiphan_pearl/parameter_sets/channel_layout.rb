module EpiphanPearl
  class ChannelLayout < ParameterSet
    register_parameters [
      {
        :key        => "active_layout",
        :value_type => EpiphanPearl::Types::Integer
      }
    ]
  end
end
