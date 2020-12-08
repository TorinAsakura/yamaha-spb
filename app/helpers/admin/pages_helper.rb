module Admin::PagesHelper
  def tree_select(pages, model, name, selected=0, level=0, init=true)
      html = ""
      # The "Root" option is added
      # so the user can choose a parent_id of 0
      if init
          # Add "Root" to the options
          html << "<select name=\"#{model}[#{name}]\" id=\"#{model}_#{name}\">\n"
          html << "\t<option value=\"0\""
#          html << " selected=\"selected\"" if selected && selected.parent_id == 0
          html << ">-</option>\n"
      end

      if pages.length > 0
        level += 1 # keep position
        pages.collect do |p|
          html << "\t<option value=\"#{p.id}\""
          html << ' selected="selected"' if selected && p.id == selected.parent_id
          html << ">"
          level.times do 
            html << "-"
          end
          html << p.title
          html << "</option>\n"
          html << tree_select(p.children, model, name, selected, level, false)
        end
      end
      html << "</select>\n" if init
      return html
  end
  
end
