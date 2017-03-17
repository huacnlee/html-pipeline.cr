require "./spec_helper"

describe HTML::Pipeline::PlainTextInputFilter do
  describe "Base" do
    filters = [
      HTML::Pipeline::PlainTextInputFilter,
    ] of HTML::Pipeline::Filter.class

    pipeline = HTML::Pipeline.new filters

    it "works" do
      assert_render pipeline, %(<script>alert</script>), %(&lt;script&gt;alert&lt;/script&gt;)
    end
  end

  describe "With Markdown" do
    filters = [
      HTML::Pipeline::PlainTextInputFilter,
      HTML::Pipeline::MarkdownFilter,
    ] of HTML::Pipeline::Filter.class

    pipeline = HTML::Pipeline.new filters

    it "works" do
      assert_render pipeline,
        %(<script>alert</script> **Strong**\n\n- 123\n\n- 456),
        %(<p>&lt;script&gt;alert&lt;/script&gt; <strong>Strong</strong></p>\n\n<ul><li>123</li></ul>\n\n<ul><li>456</li></ul>)
    end
  end
end
