# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ipgeobase"

require "simplecov"
SimpleCov.minimum_coverage 100
SimpleCov.start

require "minitest/autorun"
require "webmock/minitest"

# SimpleCov.start # mb move to up
