require_relative 'epiphan_pearl/configuration'
require_relative 'epiphan_pearl/error'
require_relative 'epiphan_pearl/network'
require_relative 'epiphan_pearl/parameter'

module EpiphanPearl
  extend self

  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    config = configuration
    block_given? ? yield(config) : config
    config
  end
end
