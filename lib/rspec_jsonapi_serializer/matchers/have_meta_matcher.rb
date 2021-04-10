# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/base"
require "rspec_jsonapi_serializer/matchers/have_meta_matchers/as_matcher"

module RSpecJSONAPISerializer
  module Matchers
    class HaveMetaMatcher < Base
      def matches?(serializer_instance)
        @serializer_instance = serializer_instance

        has_meta? && submatchers_match?
      end

      def as(value)
        add_submatcher HaveMetaMatchers::AsMatcher.new(expected, value)

        self
      end

      def as_nil
        add_submatcher HaveMetaMatchers::AsMatcher.new(expected, nil)

        self
      end

      def main_failure_message
        "expected #{serializer_name} to serialize meta #{expected}." unless has_meta?
      end

      private

      def metas
        @metas ||= serializable_hash.dig(:data, :meta) || {}
      end

      def has_meta?
        metas.has_key?(expected)
      end
    end
  end
end
