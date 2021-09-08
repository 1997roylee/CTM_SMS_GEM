# frozen_string_literal: true

module Ctm
  class CtmClient
    attr_reader :session

    def initialize
      @session = Ctm::Session.new(resources_url)
    end

    def send_sms(params)
      session.get(params)
    end

    private

    def resources_url
      Ctm::Constants.construct_api_endpoint(Ctm::Constants::SEND_SMS_PATH)
    end
  end
end
