# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/base"

module RSpecJSONAPISerializer
  module Matchers
    module HaveLinkMatchers
      class AsMatcher < Base
        def initialize(link, expected)
          super(expected)

          @link = link
        end

        def matches?(serializer_instance)
          @serializer_instance = serializer_instance

          actual == expected
        end

        def failure_message
          [expected_message, actual_message].compact.join(", ")
        end

        private

        attr_reader :link

        def expected_message
          "expected #{serializer_instance.class.name} to serialize link #{link} as #{expected}"
        end

        def actual_message
          "got #{actual.nil? ? 'nil' : actual} instead" if links.has_key?(link)
        end

        def actual
          links[link]
        end

        def links
          serializable_hash.dig(:data, :links)
        end

        def serializable_hash
          serializer_instance.serializable_hash
        end
      end
    end
  end
end
