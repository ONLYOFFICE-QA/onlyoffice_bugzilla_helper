module OnlyofficeBugzillaHelper
  # Method to work with bug data
  module BugData
    # Get bug data of bug
    # @param bug_id [String, Integer] id of bug
    # @return [JSON] data
    def bug_data(bug_id)
      res = get_bug_result(bug_id, 80)
      res = get_bug_result(bug_id, 443) if response_redirect?(res)
      JSON.parse(res.body)['bugs'].first
    end

    # Get status of bug
    # @param bug_id [String, Integer] id of bug
    # @return [String] status of bug
    def bug_status(bug_id)
      parsed_json = bug_data(bug_id)
      parsed_json['status']
    end

    # @param bug_id [Integer] is bug exists
    # @return [Boolean]
    def bug_exists?(bug_id)
      bug_status(bug_id)
      true
    rescue JSON::ParserError
      false
    end
  end
end
