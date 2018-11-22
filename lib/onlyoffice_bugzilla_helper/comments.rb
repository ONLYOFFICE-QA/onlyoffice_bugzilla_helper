module OnlyofficeBugzillaHelper
  # Working with comments
  module Comments
    # @return [Hash] list of bug comments
    def comments(bug_id)
      res = Net::HTTP.start(@uri.host, @uri.port, use_ssl: use_ssl?) do |http|
        http.get(bug_url(bug_id, '/comment'))
      end
      JSON.parse(res.body)['bugs'][bug_id.to_s]['comments']
    end
  end
end
