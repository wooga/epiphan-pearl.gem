require_relative '../test_helper.rb'

class ParameterTest < MiniTest::Test
  context 'parameter' do
    context 'getter' do
      should 'return correct value with correct class' do
        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username/recorder/get_params.cgi?rec_sizelimit=", :body => "rec_sizelimit=1")
        assert_equal 1, EpiphanPearl::Recording.new("recorder").size_limit
      end
    end

    context 'setter' do
      should 'set correct value' do
        FakeWeb.register_uri(:get, "http://username:password@123.456.789.012/username/recorder/set_params.cgi?rec_sizelimit=1", :body => "")
        assert_equal 1, EpiphanPearl::Recording.new("recorder").size_limit = 1
      end

      should 'throw correct errors' do
        error = assert_raises RuntimeError do
          EpiphanPearl::Recording.new("recorder").size_limit = "string"
        end
        assert_equal "Invalid Value Class Exception - should be a [Integer]", error.message

        error = assert_raises RuntimeError do
          EpiphanPearl::System.new("recorder").vendor = "string"
        end
        assert_equal "Invalid Value Exception", error.message

        error = assert_raises RuntimeError do
          EpiphanPearl::ChannelEncoder.new("recorder").video_buffer_mode = -1
        end
        assert_equal "Invalid Value Exception - value should be in [1, 2]", error.message
      end
    end
  end

end
