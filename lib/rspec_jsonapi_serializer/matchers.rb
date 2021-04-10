# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/have_attribute_matcher"
require "rspec_jsonapi_serializer/matchers/have_type_matcher"

module RSpecJSONAPISerializer
  module Matchers
    # This allows us to assert attributes on a serializer, e.g.:
    # expect(serializer).to have_attribute(:email)
    # You can test custom attributes by using the submatcher "as".
    # expect(serializer).to have_attribute(:email).as('john.doe@example.com')
    def have_attribute(expected)
      HaveAttributeMatcher.new(expected)
    end

    alias_method :serialize_attribute, :have_attribute

    # This allows us to assert types on a serializer, e.g.:
    # expect(serializer).to have_type(:salesforce_serializer)
    def have_type(expected)
      HaveTypeMatcher.new(expected)
    end
  end
end