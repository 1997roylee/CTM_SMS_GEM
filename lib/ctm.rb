# frozen_string_literal: true

# Version
require 'ctm/version'
# Constants
require 'ctm/constants'
# Client
require 'ctm/ctm_client'
# Utils
require 'ctm/errors'
require 'ctm/session'

module Ctm
  class SendSms
    attr_reader :message, :to, :client

    def initialize(message, to)
      @message = message
      @to = to
      @client = Ctm::CtmClient.new
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
