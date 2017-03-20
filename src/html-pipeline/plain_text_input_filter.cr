require "html"

module HTML
  class Pipeline
    # Escape HTML code to safe chars
    # by using:
    #
    # ```
    # HTML.escape
    # ```
    class PlainTextInputFilter < TextFilter
      def call
        io = IO::Memory.new
        HTML.escape(html, io)
        io.to_s
      end
    end
  end
end
