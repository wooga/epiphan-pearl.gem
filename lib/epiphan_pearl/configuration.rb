module EpiphanPearl
  class Configuration
    attr_accessor :ip, :username, :password

    def initialize
      @ip       = "0.0.0.0"
      @username = "admin"
      @password = ""
    end
  end
end
