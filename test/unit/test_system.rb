require_relative '../test_helper.rb'

class SystemTest < MiniTest::Test
  context 'system parameter' do
    context 'getter' do
      should 'return correct value with correct class' do
        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012"+
                             "/username/get_params.cgi?firmware_version=",
                             :body => "firmware_version=1")
        assert_equal "1", EpiphanPearl::System.new.firmware_version

        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012"+
                             "/username/get_params.cgi?vendor=",
                             :body => "vendor=vendor=vendor")
        assert_equal "vendor", EpiphanPearl::System.new.vendor

        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012"+
                             "/username/get_params.cgi?frmcheck_enabled=",
                             :body => "frmcheck_enabled=on")
        assert EpiphanPearl::System.new.firmware_check_enabled

        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012"+
                             "/username/get_params.cgi?frmcheck_enabled=",
                             :body => "frmcheck_enabled=")
        assert !EpiphanPearl::System.new.firmware_check_enabled

        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012"+
                             "/ajax/channels_status.cgi",
                             :body => '{"1":{"ageoflastpacket":0.002,"input":0}}')
        assert_equal [{:last_package_age=>0.002, :input=>0, :channel_id=>"1"}],
                     EpiphanPearl::System.new.channel_statuses
      end
    end

    context 'setter' do
      should 'should not have a setter' do
        assert_raises NoMethodError do
          EpiphanPearl::System.new.firmware_version = "fubar"
        end

        assert_raises NoMethodError do
          EpiphanPearl::System.new.mac_address = "fubar"
        end

        assert_raises NoMethodError do
          EpiphanPearl::System.new.product_name = "fubar"
        end

        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012"+
                             "/username/set_params.cgi?description=d%0Ae%0Af",
                             :body => "")
        EpiphanPearl::System.new.description = "d\ne\nf"
      end
    end
  end
end
