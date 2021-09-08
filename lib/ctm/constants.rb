# frozen_string_literal: true

module Ctm
  class Constants
    ENDPOINT = 'https://emg.ctm-mobile.com:10081'
    SEND_SMS_PATH = '/servlet/SendSMS'

    def self.construct_api_endpoint(path)
      ENDPOINT + SEND_SMS_PATH + path
    end
  end
end
