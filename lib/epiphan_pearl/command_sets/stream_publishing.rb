module EpiphanPearl
  class StreamPublishing
    PARAMETERS = {
      "publish_type" => {
        :key => "publish_type",
        :value_evaluation => Proc.new do |value|
            if [*0..8].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      }
    }

    def self.publish_type(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["publish_type"], value)
    end
  end
end
