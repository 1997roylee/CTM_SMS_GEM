# frozen_string_literal: true

# Version
require 'ctm_sms/version'
# Constants
require 'ctm_sms/constants'
# Client
require 'ctm_sms/ctm_client'
# Utils
require 'ctm_sms/errors'
require 'ctm_sms/session'

module CtmSms
  class SendSms
    attr_reader :message, :to, :client

    def initialize(message, to)
      @message = message
      @to = to
      @client = CtmSms::CtmClient.new
    end

    def send_sms
      client.send_sms params
    end

    private

    def params
      {
        username: ENV.fetch('CTM_API_USERNAME'),
        password: ENV.fetch('CTM_API_PASSWORD'),
        from: ENV.fetch('CTM_FROM'),
        to: to,
        locale: 'utf-8',
        text: message
      }
    end
  end
end
