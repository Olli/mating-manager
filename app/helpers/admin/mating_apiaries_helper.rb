module Admin::MatingApiariesHelper
  def link_to_add_places(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association,
                          new_object,
                          child_index: "new_#{association}") do |builder|
        render(association.to_s.singularize + "_fields", :place => builder)
    end
    link_to_function name,
                     "$(\"#mating_units\").append(\"#{j(fields)}\");",
                     class: 'btn'
  end

end