module EpiphanPearl
  class HttpServer
    PARAMETERS = {
      "http_port" => {
        :key => "http_port",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "http_sport" => {
        :key => "http_sport",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "http_usessl" => {
        :key => "http_usessl",
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
      }
    }

    def self.port(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["http_port"], value)
    end

    def self.sport(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["http_sport"], value)
    end

    def self.usessl(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["http_usessl"], value)
    end
  end
end
