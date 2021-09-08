# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'net/https'
require 'json'

module Ctm
  class Session
    attr_reader :uri, :headers, :response

    def initialize(uri, headers = {})
      @uri = URI.parse(uri)
      @headers = headers
    end

    def get(params)
      uri.query = URI.encode_www_form(params)
      @response = Net::HTTP.get_response(uri)

      response.body if response.is_a?(Net::HTTPSuccess)
      # JSON.parse(response.body).with_indifferent_access if response.is_a?(Net::HTTPSuccess)
    end

    def get!(params)
      get(params) || raise(response.body)
    end

    def status_ok?
      response.is_a?(Net::HTTPSuccess)
    end

    def status_failed?
      response.is_a?(Net::HTTPError)
    end
  end
end
