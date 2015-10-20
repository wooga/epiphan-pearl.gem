module EpiphanPearl
  class Recording
    PARAMETERS = {
      "rec_enabled" => {
        :key => "rec_enabled",
        :value_evaluation => Proc.new do |value|
            if [true, false].include?(value)
              value ? "on" : ""
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result == "on"
          end
      },
      "rec_format" => {
        :key => "rec_format",
        :value_evaluation => Proc.new do |value|
            if ["avi", "mov", "mp4", "ts"].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "rec_prefix" => {
        :key => "rec_prefix",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "rec_sizelimit" => {
        :key => "rec_sizelimit",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Integer) ? value : nil
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "rec_timelimit" => {
        :key => "rec_timelimit",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Integer) ? value : nil
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      }
    }

    def self.start(device)
      EpiphanPearl::Base.toggle(device, PARAMETERS["rec_enabled"], true)
    end

    def self.stop(device)
      EpiphanPearl::Base.toggle(device, PARAMETERS["rec_enabled"], false)
    end

    def self.started(device)
      EpiphanPearl::Base.toggle(device, PARAMETERS["rec_enabled"])
    end

    def self.format(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["rec_format"], value)
    end

    def self.prefix(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["rec_prefix"], value)
    end

    def self.sizelimit(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["rec_sizelimit"], value)
    end

    def self.timelimit(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["rec_timelimit"], value)
    end
  end
end
