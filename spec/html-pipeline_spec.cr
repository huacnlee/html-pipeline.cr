require "./spec_helper"

describe HTML::Pipeline do
  filters = [] of HTML::Pipeline::Filter.class
  pipeline = HTML::Pipeline.new(filters)

  describe ".parse" do
    it "works" do
      doc = HTML::Pipeline.parse("<html><div class=\"panel panel-default\">Hello</div></html>")
      doc.is_a?(XML::Node).should eq(true)
    end
  end

  describe "Initialize" do
    it "works" do
      pipeline.filters.size.should eq(0)
    end

    it "context work" do
      default_payload = {
        "class" => "foo bar",
      }
      payload = {
        "asset_root" => "http://your-domain.com/where/your/images/live/icons",
        "base_url"   => "http://your-domain.com",
      }
      pipeline = HTML::Pipeline.new filters, default_payload
      new_payload = pipeline.default_payload(payload)
      new_payload["asset_root"].should eq(payload["asset_root"])
      new_payload["base_url"].should eq(payload["base_url"])
      new_payload["class"].should eq(default_payload["class"])
    end
  end
end
