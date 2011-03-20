module ImageHelper
  def icon_tag(name,options={})
    image_tag("icons/#{name}.png",options)
  end
end