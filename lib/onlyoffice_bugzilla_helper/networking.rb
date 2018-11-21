module OnlyofficeBugzillaHelper
  # Code for networking
  module Networking
    private

    # @return [True, False] is ssl shold be used
    def use_ssl?
      @uri.scheme == 'https'
    end
  end
end