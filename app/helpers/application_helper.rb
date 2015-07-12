#encoding: utf-8

module ApplicationHelper

  # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title)                          # Method definition
    base_title = "Life Church"  # Variable assignment
    page = page_title.to_s.html_safe
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      "#{base_title} | #{page_title}"                 # String interpolation
    end
  end


  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end


  def sortable(column, title = nil)
      title ||= column.titleize
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
 
      
      link_to title, {:sort => column, :direction => direction}, {:class => 'btn btn-flat  '}
    
 
    end
    
    def markdown(text)
       renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
       options = {
         autolink: true,
         no_intra_emphasis: true,
         fenced_code_blocks: true,
         lax_html_blocks: true,
         strikethrough: true,
         superscript: true
       }
       Redcarpet::Markdown.new(renderer, options).render(text).html_safe
     end

end
