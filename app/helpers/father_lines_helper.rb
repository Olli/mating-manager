module FatherLinesHelper
  def show_status(father_line)
    status = father_line.state
    if father_line.active? and not father_line.mating_apiary.blank?
       status = content_tag :span, status, class: "label label-success"
       status += " "
       status += link_to( father_line.mating_apiary.name,mating_apiary_path(father_line.mating_apiary) )
    elsif father_line.archived?
      status = content_tag :span, status, class: "label label-warning"
    else
      status = content_tag :span, status, class: "label"
    end
    status.html_safe
  end
end