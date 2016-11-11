module ChaptersHelper
  def authors_tag chapter
    tag = "<ul class='horizontal-clean-list' style='display: inline-block;'>"
    chapter.authors.pluck(:username).each do |username|
      tag << "<li>#{username}</li>"
    end
    tag << '</ul>'
    raw tag
  end
end
