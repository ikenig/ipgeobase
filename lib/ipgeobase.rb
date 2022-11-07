# frozen_string_literal: true

require_relative "ipgeobase/version"
require_relative "ipgeobase/iplookupable"
require "net/http"
require "addressable/uri"

# Service to lookup geo data by IP
module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip_address)
    uri = Addressable::URI.parse("http://ip-api.com/xml/#{ip_address}")
    res = Net::HTTP.get_response(uri)
    return Iplookupable.parse(res.body, single: true) if res.is_a?(Net::HTTPSuccess)

    raise Error, "Invalid IP-Address or service ip-api is not available"
  end
end
