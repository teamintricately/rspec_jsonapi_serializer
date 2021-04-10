# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/have_attribute_matcher"

module RSpecJSONAPISerializer
  module Matchers
    def have_attribute(expected)
      HaveAttributeMatcher.new(expected)
    end

    alias_method :serialize_attribute, :have_attribute
  end
end
