module OnlyofficeBugzillaHelper
  # Method to work with bug data
  module BugData
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
