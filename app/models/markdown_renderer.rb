class MarkdownRenderer
  def self.render(markdown)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, fenced_code_blocks: true)
    renderer.render(markdown)
  end
end
