require_relative 'epiphan_pearl/base'
require_relative 'epiphan_pearl/configuration'

require_relative 'epiphan_pearl/command_sets/audio'
require_relative 'epiphan_pearl/command_sets/broadcast'
require_relative 'epiphan_pearl/command_sets/channel_encoder'
require_relative 'epiphan_pearl/command_sets/channel_layout'
require_relative 'epiphan_pearl/command_sets/content_metadata'
require_relative 'epiphan_pearl/command_sets/frame_grabber'
require_relative 'epiphan_pearl/command_sets/http_server'
require_relative 'epiphan_pearl/command_sets/ip_access_control'
require_relative 'epiphan_pearl/command_sets/mpeg_ts'
require_relative 'epiphan_pearl/command_sets/recording'
require_relative 'epiphan_pearl/command_sets/rtmp_push'
require_relative 'epiphan_pearl/command_sets/rtp_udp'
require_relative 'epiphan_pearl/command_sets/rtsp_announcement'
require_relative 'epiphan_pearl/command_sets/sap'
require_relative 'epiphan_pearl/command_sets/stream_publishing'
require_relative 'epiphan_pearl/command_sets/system'
require_relative 'epiphan_pearl/command_sets/touch_screen'
require_relative 'epiphan_pearl/command_sets/upnp'


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
