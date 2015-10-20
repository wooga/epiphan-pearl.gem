module EpiphanPearl
  class ContentMetadata
    PARAMETERS = {
      "author" => {
        :key => "author",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "comment" => {
        :key => "comment",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "copyright" => {
        :key => "copyright",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      },
      "title" => {
        :key => "title",
        :value_evaluation => Proc.new do |value|
            value.to_s
          end,
        :result_processing => Proc.new do |result|
            result
          end
      }
    }

    def self.author(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["author"], value)
    end

    def self.comment(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["comment"], value)
    end

    def self.copyright(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["copyright"], value)
    end

    def self.title(device, value = nil)
      EpiphanPearl::Base.toggle(device, PARAMETERS["title"], value)
    end
  end
end
