require_relative '../test_helper.rb'

class SystemTest < MiniTest::Test
  context 'system parameter' do
    context 'getter' do
      should 'return correct value with correct class' do
        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username//get_params.cgi?firmware_version=", :body => "firmware_version=1")
        assert_equal "1", EpiphanPearl::System.new("").firmware_version
      end
    end
  end
end
