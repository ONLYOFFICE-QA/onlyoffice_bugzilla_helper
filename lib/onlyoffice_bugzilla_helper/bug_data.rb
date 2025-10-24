# frozen_string_literal: true

module OnlyofficeBugzillaHelper
  # Method to work with bug data
  module BugData
    # Get bug data of bug
    # @param bug_id [String, Integer] id of bug
    # @return [JSON] data
    def bug_data(bug_id)
      res = get_bug_result(bug_id)
      JSON.parse(res.body)['bugs'].first
    end

    # Get status of bug
    # @param bug_id [String, Integer] id of bug
    # @return [String] status of bug
    def bug_status(bug_id)
      parsed_json = bug_data(bug_id)
      parsed_json['status']
    end

    # Check if bug exists
    # @param bug_id [Integer] id of bug
    # @return [Boolean]
    def bug_exists?(bug_id)
      bug_status(bug_id)
      true
    rescue JSON::ParserError, NoMethodError
      false
    end

    # Get list of bugs filtered by parameters
    # @param filters [Hash] dictionary of filters (e.g., {'status' => 'NEW', 'product' => "Office" })
    # @return [Array] list of bugs
    def get_bugs_by_filter(filters)
      result = get_bugs_result(filters)
      JSON.parse(result.body).fetch('bugs', [])
    end

    # Get history of bug
    # @param bug_id [Integer] id of bug
    # @return [Array] history of bug
    def get_bug_history(bug_id)
      result = get_bug_history_result(bug_id)
      JSON.parse(result.body).fetch('bugs', []).first.fetch('history', [])
    end
  end
end
