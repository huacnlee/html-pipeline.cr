HTML::Pipeline
==============

HTML processing filters and utilities for Crystal.

This is Crystal implement like [html-pipeline](https://github.com/jch/html-pipeline) in Ruby.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  html-pipeline:
    github: huacnlee/html-pipeline
```

## Usage

```crystal
require "html-pipeline"

filters = [
  HTML::Pipeline::MarkdownFilter
] of HTML::Pipeline::Filter
pipeline = HTML::Pipeline.new(filters)
pipeline.to_html("Markdown context")
```

## LICENSE

MIT License
