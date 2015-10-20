module EpiphanPearl
  class ChannelLayout
    PARAMETERS = {
      "active_layout" => {
        :key => "active_layout",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Integer) ? value : nil
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      }
    }

    def self.active_layout(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["active_layout"], value)
    end
  end
end
