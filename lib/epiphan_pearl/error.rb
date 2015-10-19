module EpiphanPearl
  class Error
    @@error = nil
    @@new_error = false

    def self.last
      @@new_error = false
      @@error
    end

    def self.new_error
      begin
        @@new_error
      ensure
        @@new_error = false
      end
    end

    def self.set(error)
      @@error     = error
      @@new_error = true
    end
  end
end
