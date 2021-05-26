# frozen_string_literal: true

require "rspec_jsonapi_serializer/metadata/relationships"

module RSpecJSONAPISerializer
  module Matchers
    module AssociationMatchers
      class IdMethodNameMatcher < Base
        def initialize(value, relationship_target)
          super(value)

          @relationship_target  = relationship_target
        end

        def matches?(serializer_instance)
          @serializer_instance = serializer_instance

          actual == expected
        end

        def main_failure_message
          [expected_message, actual_message].compact.join(", ")
        end

        private

        attr_reader :relationship_target

        def expected_message
          "expected #{serializer_name} to use #{expected} as id_method_name for #{relationship_target}"
        end

        def actual_message
          actual ? "got #{actual} instead" : nil
        end

        def actual
          metadata.relationship(relationship_target).id_method_name
        end

        def metadata
          Metadata::Relationships.new(serializer_instance)
        end
      end
    end
  end
end
