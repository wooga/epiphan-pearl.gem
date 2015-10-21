require 'minitest/autorun'
require 'minitest/unit'
require 'shoulda/context'
require 'fakeweb'
require 'epiphan_pearl'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

class Minitest::Test
  def setup
    EpiphanPearl.configure do |config|
      config.ip         = "123.456.789.012"
      config.username   = "username"
      config.password   = 'password'
    end
    FakeWeb.allow_net_connect = false
  end
end
