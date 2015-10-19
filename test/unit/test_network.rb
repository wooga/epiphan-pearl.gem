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
        assert_equal EpiphanPearl::Network.generate_url("recorder", {"param" => ""}, false), getter_url

        setter_url = "http://123.456.789.012/username/recorder/set_params.cgi?param=value"
        assert_equal EpiphanPearl::Network.generate_url("recorder", {"param" => "value"}, true), setter_url
      end

      should 'send correct request' do
        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username/recorder/set_params.cgi?param=value", :body => "param=value")
        response = EpiphanPearl::Network.create_request("recorder", {"param" => "value"}, true, true)

        assert_equal response.body, "param=value"
      end
    end
  end
end
