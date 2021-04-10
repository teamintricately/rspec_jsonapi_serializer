# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/base"
require "rspec_jsonapi_serializer/matchers/have_link_matchers/as_matcher"

module RSpecJSONAPISerializer
  module Matchers
    class HaveLinkMatcher < Base
      def matches?(serializer_instance)
        @serializer_instance = serializer_instance

        has_link? && submatchers_match?
      end

      def as(value)
        add_submatcher HaveLinkMatchers::AsMatcher.new(expected, value)

        self
      end

      def as_nil
        add_submatcher HaveLinkMatchers::AsMatcher.new(expected, nil)

        self
      end

      def main_failure_message
        "expected #{serializer_name} to have link #{expected}." unless has_link?
      end

      private

      def has_link?
        links.has_key?(expected)
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
