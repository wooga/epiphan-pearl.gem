module EpiphanPearl
  class FrameGrabber
    PARAMETERS = {
      "gain" => {
        :key => "gain",
        :value_evaluation => Proc.new do |value|
            if [*0..255].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "hshift" => {
        :key => "hshift",
        :value_evaluation => Proc.new do |value|
            if [*-999..999].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "offset" => {
        :key => "offset",
        :value_evaluation => Proc.new do |value|
            if [*0..63].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "phase" => {
        :key => "phase",
        :value_evaluation => Proc.new do |value|
            if [*0..31].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "pll" => {
        :key => "pll",
        :value_evaluation => Proc.new do |value|
            if [*-999..999].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "tune_interval" => {
        :key => "tune_interval",
        :value_evaluation => Proc.new do |value|
            if [*0..9999].include?(value)
              value
            else
              nil
            end
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      },
      "vshift" => {
        :key => "vshift",
        :value_evaluation => Proc.new do |value|
            if [*-20..20].include?(value)
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

    def self.gain(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["gain"], value)
    end

    def self.hshift(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["hshift"], value)
    end

    def self.offset(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["offset"], value)
    end

    def self.phase(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["phase"], value)
    end

    def self.pll(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["pll"], value)
    end

    def self.tune_interval(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["tune_interval"], value)
    end

    def self.vshift(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["vshift"], value)
    end
  end
end
