require "./spec_helper"

describe HTML::Pipeline::AutolinkFilter do
  describe "Base" do
    filters = [
      HTML::Pipeline::AutolinkFilter,
    ] of HTML::Pipeline::Filter.class

    pipeline = HTML::Pipeline.new filters

    it "http work" do
      assert_render pipeline,
        %(Hello https://github.com/huacnlee/html-pipeline),
        %(Hello <a href="https://github.com/huacnlee/html-pipeline">https://github.com/huacnlee/html-pipeline</a>)
    end

    it "中文 work" do
      assert_render pipeline,
        %(Hello https://github.com/huacnlee/html-pipeline中文),
        %(Hello <a href="https://github.com/huacnlee/html-pipeline中文">https://github.com/huacnlee/html-pipeline中文</a>)
    end
  end
end
