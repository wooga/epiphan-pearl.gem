module EpiphanPearl
  module Types
    class Base
      def self.pre_processing(value)
        value
      end

      def self.post_processing(value)
        value
      end

      def self.is_value_type_of?(value)
        false
      end
    end

    class Boolean < Base
      def self.is_value_type_of?(value)
        value.is_a?(TrueClass) || value.is_a?(FalseClass)
      end

      def self.pre_processing(value)
        value ? "on" : ""
      end

      def self.post_processing(value)
        value == "on"
      end
    end

    class Array < Base
      def self.is_value_type_of?(value)
        value.is_a? ::Array
      end

      def self.pre_processing(value)
        value.join(",")
      end

      def self.post_processing(value)
        value.split(/,/)
      end
    end

    class Integer < Base
      def self.is_value_type_of?(value)
        value.is_a? ::Integer
      end

      def self.pre_processing(value)
        value.to_i
      end

      def self.post_processing(value)
        value.to_i
      end
    end

    class Hash < Base
      def self.is_value_type_of?(value)
        value.is_a? ::Hash
      end
    end
  end
end
