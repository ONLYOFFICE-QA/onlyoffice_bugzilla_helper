require 'cgi'
require 'json'
require 'net/http'
require 'uri'
require 'onlyoffice_bugzilla_helper/bug_data'
require 'onlyoffice_bugzilla_helper/networking'
require 'onlyoffice_bugzilla_helper/version'

# Helper for bugzilla, used in QA
module OnlyofficeBugzillaHelper
  # Class to check bugzilla via http
  class BugzillaHelper
    include BugData
    include Networking
    attr_reader :url

    def initialize(bugzilla_url: 'https://bugzilla.onlyoffice.com',
                   api_key: BugzillaHelper.read_token)
      @uri = URI.parse(bugzilla_url)
      @key = api_key
      @show_bug_path = '/show_bug.cgi'
      @show_bug_param = 'id'
    end

    # Get bug id from url
    # @param string [String] string for error
    # @return [Integer, Nil] result of bug id from url
    def bug_id_from_string(string)
      return nil unless string =~ URI::DEFAULT_PARSER.make_regexp

      uri = URI.parse(string)
      return nil unless uri.host == url
      return nil unless uri.path == @show_bug_path

      id = CGI.parse(uri.query)[@show_bug_param].first.to_i
      return nil if id.zero?

      id
    end

    # Read access token from file system
    # @return [String] token
    def self.read_token
      return ENV['BUGZILLA_API_KEY'] if ENV['BUGZILLA_API_KEY']

      File.read(Dir.home + '/.bugzilla/api_key').delete("\n")
    rescue Errno::ENOENT
      raise Errno::ENOENT,
            "No access token found in #{Dir.home}/.bugzilla/api_key" \
            "Please create files #{Dir.home}/.bugzilla/api_key"
    end

    private

    # @param id [Integer] id of bug
    # @return [String] url of bug on server with api key
    def bug_url(id)
      "/rest/bug/#{id}?api_key=#{@key}"
    end

    # @param bug_id [Integer] id of bug
    # @return [Net::HTTPResponse] result of request
    def get_bug_result(bug_id)
      Net::HTTP.start(@uri.host, @uri.port, use_ssl: use_ssl?) do |http|
        http.get(bug_url(bug_id))
      end
    end
  end
end
