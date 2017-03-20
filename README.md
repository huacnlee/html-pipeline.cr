HTML::Pipeline
==============

[![Build status](https://travis-ci.org/huacnlee/html-pipeline.svg?branch=master)](https://travis-ci.org/huacnlee/html-pipeline)

HTML processing filters and utilities for Crystal.

This is Crystal implement like [html-pipeline](https://github.com/jch/html-pipeline) in Ruby.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  html-pipeline:
    github: huacnlee/html-pipeline
```

## Filters

- PlainTextInputFilter - HTML.escape
- MarkdownFilter
- AutolinkFilter - Autolink for any urls.

## Usage

```crystal
require "html-pipeline"

filters = [
  HTML::Pipeline::PlainTextInputFilter,
  HTML::Pipeline::MarkdownFilter,
  HTML::Pipeline::AutolinkFilter,
] of HTML::Pipeline::Filter
pipeline = HTML::Pipeline.new(filters)
pipeline.to_html("Markdown context")
```

## LICENSE

MIT License
