module EpiphanPearl
  class TouchScreen
    PARAMETERS = {
      "touchscreen_backlight" => {
        :key => "touchscreen_backlight",
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
      "touchscreen_enabled" => {
        :key => "touchscreen_enabled",
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
      "touchscreen_info" => {
        :key => "touchscreen_info",
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
      "touchscreen_preview" => {
        :key => "touchscreen_preview",
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
      "touchscreen_recordctrl" => {
        :key => "touchscreen_recordctrl",
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
      "touchscreen_settings" => {
        :key => "touchscreen_settings",
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
      "touchscreen_timeout" => {
        :key => "touchscreen_timeout",
        :value_evaluation => Proc.new do |value|
            value.is_a?(Integer) ? value : nil
          end,
        :result_processing => Proc.new do |result|
            result.to_i
          end
      }
    }

    def self.backlight(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["touchscreen_backlight"], value)
    end

    def self.enabled(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["touchscreen_enabled"], value)
    end

    def self.info(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["touchscreen_info"], value)
    end

    def self.preview(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["touchscreen_preview"], value)
    end

    def self.record_control(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["touchscreen_recordctrl"], value)
    end

    def self.settings(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["touchscreen_settings"], value)
    end

    def self.timeout(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["touchscreen_timeout"], value)
    end
  end
end
