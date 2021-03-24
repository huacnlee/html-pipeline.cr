require "spec"
require "../src/html-pipeline"

def assert_render(pipeline, input, output, file = __FILE__, line = __LINE__)
  it "call #{input.inspect}", file, line do
    pipeline.call(input).should eq(output)
  end
end
