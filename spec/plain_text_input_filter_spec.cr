require "./spec_helper"

describe HTML::Pipeline::PlainTextInputFilter do
  filters = [
    HTML::Pipeline::PlainTextInputFilter,
  ] of HTML::Pipeline::Filter.class

  pipeline = HTML::Pipeline.new filters

  it "works" do
    assert_render pipeline, %(<script>alert</script>), %(<div>&lt;script&gt;alert&lt;/script&gt;</div>)
  end
end
