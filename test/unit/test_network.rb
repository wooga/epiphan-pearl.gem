require_relative '../test_helper.rb'

class NetworkTest < MiniTest::Test
  context 'network' do
    context 'config' do
      should 'have default values' do
        config = EpiphanPearl.configuration

        assert_equal config.ip, "123.456.789.012"
        assert_equal config.username, "username"
        assert_equal config.password, "password"
      end
    end

    context 'handler' do
      should 'generate correct url' do
        getter_url = "http://123.456.789.012/username/recorder/get_params.cgi?param="
        assert_equal getter_url, EpiphanPearl::Network.generate_url("recorder", {"param" => ""}, false)

        setter_url = "http://123.456.789.012/username/recorder/set_params.cgi?param=value"
        assert_equal setter_url, EpiphanPearl::Network.generate_url("recorder", {"param" => "value"}, true)
      end

      should 'send correct request' do
        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username/recorder/set_params.cgi?param=value", :body => "param=value")
        response = EpiphanPearl::Network.create_request("recorder", {"param" => "value"}, true, true)

        assert_equal "param=value", response.body
      end

      should 'throw correct errors' do
        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username/recorder/set_params.cgi?param=value", :status => ["401"])
        EpiphanPearl::Network.create_request("recorder", {"param" => "value"}, true, true)
        assert_equal :authentication_error, EpiphanPearl::Error.last

        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username/recorder/set_params.cgi?param=value", :status => ["404"])
        EpiphanPearl::Network.create_request("recorder", {"param" => "value"}, true, true)
        assert_equal :unknown_device_error, EpiphanPearl::Error.last

        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username/recorder/set_params.cgi?param=value", :body => "<>Unknown parameter<>")
        EpiphanPearl::Network.create_request("recorder", {"param" => "value"}, true, true)
        assert_equal :unknown_parameter_error, EpiphanPearl::Error.last
      end
    end
  end
end
