# frozen_string_literal: true

module RSpecJSONAPISerializer
  module Matchers
    class Base
      def initialize(expected)
        @expected    = expected
        @submatchers = []
      end

      def matches?(serializer_instance)
        raise NotImplementedError
      end

      def failure_message
        ([main_failure_message] + submatcher_failure_messages).compact.join("\n")
      end

      def failure_message_when_negated
        ([main_failure_message_when_negated] + submatcher_failure_messages_when_negated)
          .compact
          .join("\n")
      end

      protected

      attr_reader :expected, :serializer_instance, :submatchers

      def main_failure_message
        raise NotImplementedError
      end

      def main_failure_message_when_negated
        raise NotImplementedError
      end

      def add_submatcher(submatcher)
        submatchers << submatcher
      end

      def submatchers_match?
        submatchers.all? { |submatcher| submatcher.matches?(serializer_instance) }
      end

      def serializable_hash
        serializer_instance.serializable_hash
      end

      def serializer_name
        serializer_instance.class.name
      end

      private

      def submatcher_failure_messages
        failing_submatchers.map(&:failure_message)
      end

      def submatcher_failure_messages_when_negated
        failing_submatchers.map(&:failure_message_when_negated)
      end

      def failing_submatchers
        @failing_submatchers ||= submatchers.select do |submatcher|
          !submatcher.matches?(serializer_instance)
        end
      end
    end
  end
end
