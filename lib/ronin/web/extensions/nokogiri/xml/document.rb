require 'nokogiri'

module Nokogiri
  module XML
    class Document < Node

      #
      # Calculates the sum of all sub-children of the document.
      #
      # @return [Integer]
      #   The total number of children and sub-children of the document.
      #   Returns `0` if the document has no root element.
      #
      def total_children
        return 0 unless root

        1 + root.total_children
      end

    end
  end
end
