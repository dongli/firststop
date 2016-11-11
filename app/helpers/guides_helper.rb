module GuidesHelper
  def editors_tag guide
    tag = "<ul class='horizontal-clean-list' style='display: inline-block;'>"
    guide.editors.pluck(:username).each do |username|
      tag << "<li>#{username}</li>"
    end
    tag << '</ul>'
    raw tag
  end
end
