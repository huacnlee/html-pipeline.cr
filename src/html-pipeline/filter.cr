module HTML
  class Pipeline
    # Base Filter
    #
    # You can write your custom filter by inherit this class.
    #
    # For example:
    #
    # ```crystal
    # class AutolinkFilter < HTML::Pipeline::Filter
    #   def call
    #     # do your custom filter
    #   end
    # end
    # ```
    #
    # And you can find more example in GitHub:
    # https://github.com/huacnlee/html-pipeline/blob/master/src/html-pipeline
    abstract class Filter
      getter context
      # XML::Node type of process data.
      getter doc
      # String type of process data.
      getter html

      # Must implement this method when you wan't write a custom filter.
      abstract def call

      @html : String
      @doc : XML::Node

      def initialize(doc, context = {"" => ""})
        if doc.is_a?(XML::Node)
          @html = doc.content
          @doc = doc
        else
          @html = doc.to_s
          @doc = parse_html(@html)
        end

        @context = context
      end

      def parse_html(html : String)
        HTML::Pipeline.parse(html)
      end

      def self.call(doc, context = {"" => ""})
        new(doc, context).call
      end
    end
  end
end
