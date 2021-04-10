# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/base"

module RSpecJSONAPISerializer
  module Matchers
    module HaveAttributeMatchers
      class AsMatcher < Base
        def initialize(attribute, expected)
          super(expected)

          @attribute = attribute
        end

        def matches?(serializer_instance)
          @serializer_instance = serializer_instance

          actual == expected
        end

        def failure_message
          [expected_message, actual_message].compact.join(", ")
        end

        private

        attr_reader :attribute

        def expected_message
          "expected #{serializer_instance.class.name} to serialize #{attribute} as #{expected}"
        end

        def actual_message
          "got #{actual.nil? ? 'nil' : actual} instead" if attributes.has_key?(attribute)
        end

        def actual
          attributes[attribute]
        end

        def attributes
          serializable_hash.dig(:data, :attributes)
        end

        def serializable_hash
          serializer_instance.serializable_hash
        end
      end
    end
  end
end
