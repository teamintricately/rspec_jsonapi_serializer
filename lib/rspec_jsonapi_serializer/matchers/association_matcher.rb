# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/base"
require "rspec_jsonapi_serializer/matchers/association_matchers/serializer_matcher"
require "rspec_jsonapi_serializer/metadata/relationships"

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

        relationship_matches? && submatchers_match?
      end

      def serializer(value)
        add_submatcher AssociationMatchers::SerializerMatcher.new(value, expected)

        self
      end

      def main_failure_message
        [expected_message, actual_message].compact.join(", ")
      end

      private

      attr_reader :relationship_matcher, :relationship_type

      def expected_message
        "expected #{serializer_name} to #{association_message} #{expected}"
      end

      def relationship_matches?
        actual.present? && actual.relationship_type == relationship_type
      end

      def actual_message
        actual ? "got :#{actual.relationship_type} instead" : nil
      end

      def association_message
        relationship_matcher.to_s.split('_')
      end

      def actual
        metadata.relationship(expected)
      end

      def relationships
        metadata.relationships
      end

      def metadata
        Metadata::Relationships.new(serializer_instance)
      end
    end
  end
end
