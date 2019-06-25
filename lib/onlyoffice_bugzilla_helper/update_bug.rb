# frozen_string_literal: true

module OnlyofficeBugzillaHelper
  # Method to updating bug data
  module UpdateBug
    def update_bug(bug_id, params = {})
      req = Net::HTTP::Put.new(bug_url(bug_id))
      req.body = params.to_json
      req.add_field('Content-Type', 'text/plain')
      connection = Net::HTTP.new(@url.host, @url.port)
      connection.use_ssl = use_ssl?
      connection.start { |http| http.request(req) }
    end
  end
end
