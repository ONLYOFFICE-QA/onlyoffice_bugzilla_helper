# frozen_string_literal: true

require 'cgi'
require 'json'
require 'net/http'
require 'uri'
require 'onlyoffice_bugzilla_helper/bug_data'
require 'onlyoffice_bugzilla_helper/comments'
require 'onlyoffice_bugzilla_helper/logger_wrapper'
require 'onlyoffice_bugzilla_helper/networking'
require 'onlyoffice_bugzilla_helper/update_bug'
require 'onlyoffice_bugzilla_helper/version'

# Helper for bugzilla, used in QA
module OnlyofficeBugzillaHelper
  # Class to check bugzilla via http
  class BugzillaHelper
    include BugData
    include Comments
    include LoggerWrapper
    include Networking
    include UpdateBug
    attr_reader :url

    def initialize(bugzilla_url: 'https://bugzilla.onlyoffice.com',
                   api_key: BugzillaHelper.read_token)
      @url = URI.parse(bugzilla_url)
      @key = api_key
      @show_bug_path = '/show_bug.cgi'
      @show_bug_param = 'id'
    end

    # Get bug id from url
    # @param string [String] string for error
    # @return [Integer, Nil] result of bug id from url
    def bug_id_from_string(string)
      uri = URI.parse(string)
      return nil unless uri.host == url.host
      return nil unless uri.path == @show_bug_path

      id = CGI.parse(uri.query)[@show_bug_param].first.to_i
      return nil if id.zero?

      id
    rescue URI::InvalidURIError
      nil
    end

    # Read access token from file system
    # @param force_file_read [True, False] force read api key from file
    # @param token_path [String] path to file with API Token
    # @return [String] token
    def self.read_token(force_file_read: false,
                        token_path: "#{Dir.home}/.bugzilla/api_key")
      # rubocop:disable Style/FetchEnvVar
      return ENV['BUGZILLA_API_KEY'] if ENV.key?('BUGZILLA_API_KEY') && !force_file_read
      # rubocop:enable Style/FetchEnvVar

      File.read(token_path).delete("\n")
    rescue Errno::ENOENT
      raise Errno::ENOENT,
            "No access token found in #{Dir.home}/.bugzilla/api_key" \
            "Please create files #{Dir.home}/.bugzilla/api_key"
    end

    private

    # @param id [Integer] id of bug
    # @return [String] url of bug on server with api key
    def bug_url(id, suffix = '')
      "/rest/bug/#{id}#{suffix}?api_key=#{@key}"
    end

    # @param bug_id [Integer] id of bug
    # @return [Net::HTTPResponse] result of request
    def get_bug_result(bug_id)
      req = Net::HTTP::Get.new(bug_url(bug_id))
      perform_request(req)
    end
  end
end
