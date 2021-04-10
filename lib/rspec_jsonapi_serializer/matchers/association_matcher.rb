# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/base"

module RSpecJSONAPISerializer
  module Matchers
    class AssociationMatcher < Base
      def initialize(expected, relationship_matcher, relationship_type)
        super(expected)

        @relationship_matcher = relationship_matcher
        @relationship_type    = relationship_type
      end

      def matches?(serializer_instance)
        @serializer_instance = serializer_instance

        relationships.select { |_, r| r.relationship_type == relationship_type }
                     .has_key?(expected)
      end

      def main_failure_message
        [expected_message, actual_message].compact.join(", ")
      end

      private

      attr_reader :relationship_matcher, :relationship_type

      def expected_message
        "expected #{serializer_name} to #{association_message} #{expected}"
      end

      def actual_message
        actual ? "got :#{actual} instead" : nil
      end

      def association_message
        relationship_matcher.to_s.split('_')
      end

      def actual
        relationships.key(expected) || relationship.key(expected.to_s)
      end

      def relationships
        @relationships ||= serializer_instance.class&.relationships_to_serialize || {}
      end
    end
  end
end
