module EpiphanPearl
  class CommandSet
    def initialize(device)
      @device = device
    end

    def self.register_parameters(parameters)
      parameters.each do |parameter|
        method_name = parameter[:display_name].nil? ? parameter[:key] : parameter[:display_name]

        define_method("#{method_name}") do
          EpiphanPearl::Base.get(@device, parameter)
        end

        define_method("#{method_name}=") do |value|
          EpiphanPearl::Base.set(@device, parameter, value)
        end
      end
    end
  end
end
