require "./spec_helper"

private def assert_render(pipeline, input, output, file = __FILE__, line = __LINE__)
  it "call #{input.inspect}", file, line do
    pipeline.call(input).should eq(output)
  end
end

describe HTML::Pipeline::MarkdownFilter do
  filters = [
    HTML::Pipeline::MarkdownFilter,
  ] of HTML::Pipeline::Filter.class

  pipeline = HTML::Pipeline.new filters

  describe "works" do
    assert_render pipeline, %(# Heading 1\n\nHello **world**), %(<h1>Heading 1</h1>\n<p>Hello <strong>world</strong></p>\n)
  end
end
