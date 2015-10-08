require_relative 'epiphan_pearl/pearl'
require_relative 'epiphan_pearl/configuration'

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
