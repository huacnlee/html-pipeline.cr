require "remarkdown"

module HTML
  class Pipeline
    # MarkdownFilter to covert Markdown to HTML
    # by using:
    # https://github.com/huacnlee/remarkdown
    class MarkdownFilter < Filter
      def call
        @html = Remarkdown.to_html(html)
      end
    end
  end
end
