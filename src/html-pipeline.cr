require "xml"
require "./html-pipeline/filter"
require "./html-pipeline/text_filter"
require "./html-pipeline/*"

module HTML
  # HTML processing filters and utilities for Crystal.
  class Pipeline
    getter :filters

    # Parse String or XML::Node instance
    # return XML::Node instance
    def self.parse(document_or_html : XML::Node | String)
      if document_or_html.is_a?(String)
        XML.parse_html(document_or_html)
      else
        document_or_html
      end
    end

    # Initialize HTML::Pipeline to give Filter list.
    # ```
    # filters = [
    #   HTML::Pipeline::PlainTextInputFilter,
    #   HTML::Pipeline::MarkdownFilter,
    #   HTML::Pipeline::AutolinkFilter,
    # ] of HTML::Pipeline::Filter
    # pipeline = HTML::Pipeline.new(filters)
    # ```
    def initialize(filters : Array(Filter.class), default_context = {"" => ""})
      @default_context = default_context
      @filters = filters
    end

    # Convert raw content to HTML by using all filters
    # Returns HTML
    #
    # For example:
    #
    # ```
    # pipeline = HTML::Pipeline.new(filters)
    # pipeline.to_html("raw content")
    # ```
    def to_html(input, context = {"" => ""}) : String
      output = call(input, context)
      if output.respond_to?(:to_html)
        output.to_html
      else
        output.to_s
      end
    end

    # Run `call` method of all filters
    def call(html, context = {"" => ""})
      context = @default_context.merge(context)
      payload = default_payload({
        "filters" => filters.map { |f| f.name },
        "context" => context,
      })

      output =
        filters.reduce(html) do |doc, filter|
          perform_filter(filter, doc, context)
        end
    end

    def default_payload(payload : Hash)
      @default_context.merge(payload)
    end

    def perform_filter(filter, doc, context)
      payload = default_payload({
        "filter"  => filter.name,
        "context" => context,
      })
      filter.call(doc, context)
    end
  end
end
