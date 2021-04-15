# frozen_string_literal: true


require "rspec_jsonapi_serializer/metadata/relationships"

module RSpecJSONAPISerializer
  module Metadata
    class Relationships
      def initialize(serializer)
        @serializer = serializer
      end

      def relationship(key)
        relationships.values.find { |relationship| relationship.key.to_s == key.to_s }
      end

      def relationships
        serializer.class&.relationships_to_serialize || {}
      end

      private

      attr_reader :serializer
    end
  end
end
