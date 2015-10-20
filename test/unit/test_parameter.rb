require_relative '../test_helper.rb'

class ParameterTest < MiniTest::Test
  context 'parameter' do
    context 'getter' do
      should 'return correct value' do
        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username/recorder/get_params.cgi?vendor=", :body => "vendor=epiphan")
        assert_equal "epiphan", EpiphanPearl::Parameter.get("recorder", "vendor")
      end

      should 'throw correct errors' do
        assert_equal nil, EpiphanPearl::Parameter.get("recorder", "unknown_key")
        assert_equal :unknown_key_error, EpiphanPearl::Error.last
      end
    end

    context 'setter' do
      should 'set correct value' do
        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username/recorder/get_params.cgi?frmcheck_enabled=", :body => "frmcheck_enabled=on")
        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username/recorder/set_params.cgi?frmcheck_enabled=on", :body => "frmcheck_enabled=on")
        assert_equal true, EpiphanPearl::Parameter.set("recorder", "frmcheck_enabled", true)
      end

      should 'throw correct errors' do
        assert_equal false, EpiphanPearl::Parameter.set("recorder", "unknown_key", "value")
        assert_equal :unknown_key_error, EpiphanPearl::Error.last

        assert_equal false, EpiphanPearl::Parameter.set("recorder", "firmware_version", "value")
        assert_equal :unknown_value_error, EpiphanPearl::Error.last
      end
    end
  end

end
