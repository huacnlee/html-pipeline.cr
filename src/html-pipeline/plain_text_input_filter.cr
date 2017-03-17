require "html"

module HTML
  class Pipeline
    class PlainTextInputFilter < TextFilter
      def call
        io = IO::Memory.new
        HTML.escape(html, io)
        "<div>#{io.to_s}</div>"
      end
    end
  end
end
