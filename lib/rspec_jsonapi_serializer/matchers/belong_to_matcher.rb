# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/association_matcher"

module RSpecJSONAPISerializer
  module Matchers
    class BelongToMatcher
      def initialize(expected)
        @association_matcher = AssociationMatcher.new(expected, :belong_to, :belongs_to)
      end

      def matches?(serializer_instance)
        association_matcher.matches?(serializer_instance)
      end

      def main_failure_message
        association_matcher.main_failure_message
      end

      private

      attr_reader :association_matcher
    end
  end
end
