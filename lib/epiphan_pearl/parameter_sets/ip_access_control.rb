module EpiphanPearl
  class IpAccessControl < ParameterSet
    register_parameters [
      {
        :key => "allowips",
        :display_name => "allowed_ips",
        :value_class => [Array],
        :value_evaluation => Proc.new do |value|
            value.join ","
          end,
        :result_processing => Proc.new do |result|
            result.split ","
          end
      },
      {
        :key => "denyips",
        :display_name => "denied_ips",
        :value_class => [Array],
        :value_evaluation => Proc.new do |value|
            value.join ","
          end,
        :result_processing => Proc.new do |result|
            result.split ","
          end
      }
    ]
  end
end
