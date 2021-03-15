# frozen_string_literal: true

require 'logger'

module OnlyofficeBugzillaHelper
  # Logger module for logging stuff
  module LoggerWrapper
    # @return [Logger] default logger
    def logger
      @logger ||= Logger.new($stdout)
    end

    # Log info about request
    # @param [Net:HTTP] request to make
    # @param [Net:HTTP] response in result
    # @return [nil]
    def log_request(request, response)
      logger.info('Made request. '\
                  "Type: #{request.method}. "\
                  "Path: #{hide_keys(request.path)}. "\
                  "Body: #{hide_keys(request.body)}. "\
                  "Response: #{hide_keys(response.body)}")
    end

    # Hide sensitive info
    # @param [String] string to hide
    # @return [String] result
    def hide_keys(string)
      string&.gsub(@key, '[REMOVED]')
    end
  end
end
