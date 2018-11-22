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

    # Add comment to bug
    # @param bug_id [Integer] id of bug
    # @param comment [String] comment to add
    def add_comment(bug_id, comment)
      req = Net::HTTP::Post.new(bug_url(bug_id, '/comment'))
      req.body = { comment: comment }.to_json
      req.add_field('Content-Type', 'text/plain')
      connection = Net::HTTP.new(@uri.host, @uri.port)
      connection.use_ssl = use_ssl?
      connection.start { |http| http.request(req) }
    end
  end
end
