# frozen_string_literal: true

require 'minitest/autorun'
require 'ctm'
require 'uri'
require 'webmock/minitest'

class TestSms < Minitest::Test
  def test_english_hello
    stub_request(:get, construct_mock_api_endpoint)
      .to_return(body: JSON.generate({}))
    Ctm::SendSms.new('demo', '85368185610').send_sms
  end

  private

  def construct_mock_api_endpoint
    "#{Ctm::Constants.construct_api_endpoint(Ctm::Constants::SEND_SMS_PATH)}?#{URI.encode_www_form(mock_params)}"
  end

  def mock_params
    {
      username: ENV.fetch('CTM_API_USERNAME'),
      password: ENV.fetch('CTM_API_PASSWORD'),
      from: ENV.fetch('CTM_FROM'),
      to: '85368185610',
      locale: 'utf-8',
      text: 'demo'
    }
  end
end
