# frozen_string_literal: true

require 'test_helper'

class TestConstants < Minitest::Test
  def test_api_endpoint
    assert_equal 'https://emg.ctm-mobile.com:10081', Ctm::Constants::ENDPOINT
  end

  def test_send_sms_path
    assert_equal '/servlet/SendSMS', Ctm::Constants::SEND_SMS_PATH
  end

  def test_construct_api_endpoint
    assert_equal "#{Ctm::Constants::ENDPOINT}#{Ctm::Constants::SEND_SMS_PATH}/demo",
                 Ctm::Constants.construct_api_endpoint('/demo')
  end
end
