# frozen_string_literal: true

module OnlyofficeBugzillaHelper
  # Code for networking
  module Networking
    private

    # @return [True, False] is ssl shold be used
    def use_ssl?
      @url.scheme == 'https'
    end

    # Perform request for current bugzilla
    # @param [Net:HTTP] request to make
    # @return [Net:HTTPResponse] result of request
    def perform_request(request)
      connection = Net::HTTP.new(@url.host, @url.port)
      connection.use_ssl = use_ssl?
      result = connection.start { |http| http.request(request) }
      log_request(request, result)
      result
    end
  end
end
