module HTML
  class Pipeline
    abstract class TextFilter < Filter
      def initialize(doc, context = {"" => ""})
        raise "text cannot be HTML" if doc.is_a?(XML::Node)
        @html = doc.to_s
        super(@html, context)
      end
    end
  end
end
