require "cgi"
require_relative 'epiphan_pearl/base'
require_relative 'epiphan_pearl/types'
require_relative 'epiphan_pearl/parameter_set'
require_relative 'epiphan_pearl/configuration'

Dir.glob(File.dirname(__FILE__) +
         "/epiphan_pearl/parameter_sets/*.rb").each do |filename|
  require filename
end

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
