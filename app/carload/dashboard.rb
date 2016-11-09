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
    spec.attributes.permitted = [:email, :role]
    spec.index_page.shows.attributes = [:email, :role]
    spec.index_page.searches.attributes = [{:name=>:email, :term=>:cont}, {:name=>:role, :term=>:cont}]
  end
  model :guide do |spec|
    spec.default = false
    spec.attributes.permitted = [:title, :content, :toc, :user_id]
    spec.index_page.shows.attributes = [:title, :content, :toc, "user.username"]
    spec.index_page.searches.attributes = [{:name=>:title, :term=>:cont}, {:name=>:content, :term=>:cont}, {:name=>:toc, :term=>:cont}, {:name=>:user_id, :term=>:cont}]
  end
  associate({:guide=>:user, :choose_by=>:username})
end
