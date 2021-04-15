# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/belong_to_matcher"
require "rspec_jsonapi_serializer/matchers/have_attribute_matcher"
require "rspec_jsonapi_serializer/matchers/have_id_matcher"
require "rspec_jsonapi_serializer/matchers/have_link_matcher"
require "rspec_jsonapi_serializer/matchers/have_many_matcher"
require "rspec_jsonapi_serializer/matchers/have_meta_matcher"
require "rspec_jsonapi_serializer/matchers/have_one_matcher"
require "rspec_jsonapi_serializer/matchers/have_type_matcher"

module RSpecJSONAPISerializer
  module Matchers
    # This allows us to assert attributes on a serializer, e.g.:
    # expect(serializer).to belong_to(:team)
    # If you have a custom serializer, you can assert its value with the `serializer` submatcher
    # expect(serializer).to belong_to(:team).serializer(TeamSerializer)
    def belong_to(expected)
      BelongToMatcher.new(expected)
    end

    # This allows us to assert attributes on a serializer, e.g.:
    # expect(serializer).to have_attribute(:email)
    # You can test custom attributes by using the submatcher "as".
    # expect(serializer).to have_attribute(:email).as('john.doe@example.com')
    def have_attribute(expected)
      HaveAttributeMatcher.new(expected)
    end

    alias_method :serialize_attribute, :have_attribute

    # This allows us to assert ids on a serializer, e.g.:
    # expect(serializer).to have_id(:slug)
    def have_id(expected)
      HaveIdMatcher.new(expected)
    end

    # This allows us to assert links on a serializer, e.g.:
    # expect(serializer).to have_link(:self)
    # You can test custom links by using the submatcher "as".
    # expect(serializer).to have_link(:self).as('https://example.com/users/1')
    def have_link(expected)
      HaveLinkMatcher.new(expected)
    end

    alias_method :serialize_link, :have_link

    # This allows us to assert attributes on a serializer, e.g.:
    # expect(serializer).to have_many(:teams)
    # If you have a custom serializer, you can assert its value with the `serializer` submatcher
    # expect(serializer).to have_many(:teams).serializer(TeamSerializer)
    def have_many(expected)
      HaveManyMatcher.new(expected)
    end

    # This allows us to assert metadata on a serializer, e.g.:
    # expect(serializer).to have_meta(:foo)
    # You can test custom metadata by using the submatcher "as".
    # expect(serializer).to have_meta(:foo).as('bar')
    def have_meta(expected)
      HaveMetaMatcher.new(expected)
    end

    alias_method :serialize_meta, :have_meta

    # This allows us to assert attributes on a serializer, e.g.:
    # expect(serializer).to have_one(:team)
    # If you have a custom serializer, you can assert its value with the `serializer` submatcher
    # expect(serializer).to have_one(:team).serializer(TeamSerializer)
    def have_one(expected)
      HaveOneMatcher.new(expected)
    end

    # This allows us to assert types on a serializer, e.g.:
    # expect(serializer).to have_type(:salesforce_serializer)
    def have_type(expected)
      HaveTypeMatcher.new(expected)
    end
  end
end
