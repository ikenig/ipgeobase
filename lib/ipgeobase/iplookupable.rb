# frozen_string_literal: true

require "happymapper"

class Iplookupable
  include HappyMapper

  tag "query"
  element :status, String
  element :country, String
  element :country_code, String, tag: "countryCode"
  element :region, String
  element :region_name, String, tag: "regionName"
  element :city, String
  element :zip, String
  element :lat, Float
  element :lon, Float
  element :timezone, String
  element :isp, String
  element :org, String
  element :as, String
  element :query, String
end
