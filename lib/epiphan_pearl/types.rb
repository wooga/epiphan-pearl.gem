module EpiphanPearl
  module Types
    class Base
      def self.is_boolean?
        false
      end
      def self.is_integer?
        false
      end
    end

    class Boolean < Base
      def self.is_boolean?
        true
      end

      def self.is_value_type_of?(value)
        value.is_a?(TrueClass) || value.is_a?(FalseClass)
      end
    end

    class Array < Base
      def self.is_value_type_of?(value)
        value.is_a? ::Array
      end
    end

    class Integer < Base
      def self.is_integer?
        true
      end

      def self.is_value_type_of?(value)
        value.is_a? ::Integer
      end
    end

    class Hash < Base
      def self.is_value_type_of?(value)
        value.is_a? ::Hash
      end
    end
  end
end
