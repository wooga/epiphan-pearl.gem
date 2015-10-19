module EpiphanPearl
  class Error
    @@error = nil
    @@new_error = false

    def self.error
      begin
        @@error
      ensure
        @@new_error = false
        @@error = nil
      end
    end

    def self.new_error
      if @@new_error
        @@new_error = false
        true
      else
        false
      end
    end

    def self.set(error)
      puts "EpiphanPearl-Gem Error: #{error}"
      @@error     = error
      @@new_error = true
    end
  end
end
