module HTML
  class Pipeline
    abstract class Filter
      getter context
      getter result
      getter doc
      getter html

      abstract def call

      @html : String
      @doc : XML::Node

      def initialize(doc, context = {"" => ""})
        if doc.is_a?(String)
          @html = doc.to_s
          @doc = parse_html(@html)
        else
          @html = doc.content
          @doc = doc
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
