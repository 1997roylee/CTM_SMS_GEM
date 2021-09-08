# frozen_string_literal: true

require 'test_helper'

class TestConstants < Minitest::Test
  def test_api_endpoint
    assert_equal 'https://emg.ctm-mobile.com:10081', CtmSms::Constants::ENDPOINT
  end

  def test_send_sms_path
    assert_equal '/servlet/SendSMS', CtmSms::Constants::SEND_SMS_PATH
  end

  def test_construct_api_endpoint
    assert_equal "#{CtmSms::Constants::ENDPOINT}#{CtmSms::Constants::SEND_SMS_PATH}",
                 CtmSms::Constants.construct_api_endpoint(CtmSms::Constants::SEND_SMS_PATH)
  end
end
