require "remarkdown"

module HTML
  class Pipeline
    class AutolinkFilter < Filter
      # https://github.com/tenderlove/rails_autolink/blob/master/lib/rails_autolink/helpers.rb
      AUTO_LINK_RE = %r{
                  (?: ([0-9A-Za-z+.:-]+:)// | www\. )
                  [^\s<]+
                }x

      def call
        io = IO::Memory.new
        html.each_line do |line|
          io << line.gsub(AUTO_LINK_RE) do
            scheme, all = $1, $~
            href = all[0]
            %(<a href="#{href}">#{href}</a>)
          end
        end
        io.to_s
      end
    end
  end
end
