# Dashboard class is used to tell Carload what models are needed to administrated,
# which attributes are shown, etc.

class Dashboard < Carload::Dashboard
  # There are two DSL block types:
  #
  #   model :<model_name> do |spec|
  #     # Whether model should be displayed when URL does not specify one
  #     spec.default = <true_or_false>
  #     # List of attributes that can be edited
  #     spec.attributes.permitted = [...]
  #     # List of attributes that will be shown on index page
  #     spec.index_page.shows.attributes = [...]
  #     # List of attributes with search terms that can be searched on index page (using Ransack gem)
  #     spec.index_page.searches.attributes = [ { name: ..., term: ...}, ... ]
  #   end
  #
  #   associate :<model_name_a> => :<model_name_b>, choose_by: :<attribute_in_model_b>

  model :user do |spec|
    spec.default = true
    spec.attributes.permitted = [:email, :username, :avatar, :role, {:chapter_ids=>[]}, {:guide_ids=>[]}]
    spec.index_page.shows.attributes = [:email, :username, :avatar, :role]
    spec.index_page.searches.attributes = [{:name=>:email, :term=>:cont}, {:name=>:username, :term=>:cont}, {:name=>:avatar, :term=>:cont}, {:name=>:role, :term=>:cont}]
  end
  associate({:user=>:chapters, :choose_by=>:title})
  associate({:user=>:guides, :choose_by=>:title})
  model :chapter do |spec|
    spec.default = false
    spec.attributes.permitted = [:title, :abstract, :content, :toc, :guide_id, {:author_ids=>[]}]
    spec.index_page.shows.attributes = [:title, :abstract, :toc, "guide.title"]
    spec.index_page.searches.attributes = [{:name=>:title, :term=>:cont}, {:name=>:abstract, :term=>:cont}, {:name=>:content, :term=>:cont}, {:name=>:toc, :term=>:cont}, {:name=>:guide_id, :term=>:cont}]
  end
  associate({:chapter=>:authors, :choose_by=>:username})
  associate({:chapter=>:guide, :choose_by=>:title})
  model :guide do |spec|
    spec.default = false
    spec.attributes.permitted = [:title, :abstract, {:editor_ids=>[]}]
    spec.index_page.shows.attributes = [:title, :abstract]
    spec.index_page.searches.attributes = [{:name=>:title, :term=>:cont}, {:name=>:abstract, :term=>:cont}]
  end
  associate({:guide=>:chapters, :choose_by=>:title})
  associate({:guide=>:editors, :choose_by=>:username})
end
