require "remarkdown"

module HTML
  class Pipeline
    class MarkdownFilter < Filter
      def call
        @html = Remarkdown.to_html(html)
      end
    end
  end
end
