# frozen_string_literal: true

require "rspec_jsonapi_serializer/matchers/base"

module RSpecJSONAPISerializer
  module Matchers
    class HaveIdMatcher < Base
      def matches?(serializer_instance)
        @serializer_instance = serializer_instance

        actual == expected
      end

      def main_failure_message
        "expected that #{serializer_name} to have id :#{expected}, got :#{actual} instead"
      end

      private

      def actual
        serializer_instance.class.record_id
      end
    end
  end
end
