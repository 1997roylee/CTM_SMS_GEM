# frozen_string_literal: true

module CtmSms
  class CtmClient
    attr_reader :session

    def initialize
      @session = CtmSms::Session.new(resources_url)
    end

    def send_sms(params)
      session.get(params)
    end

    private

    def resources_url
      CtmSms::Constants.construct_api_endpoint(CtmSms::Constants::SEND_SMS_PATH)
    end
  end
end
