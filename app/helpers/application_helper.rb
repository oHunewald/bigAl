module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Big AL NGS Data Managment"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end  

  def template_name(template)
  	base_name = " "

  	if template.libraries.any? 
  		template.libraries.each do |f|
  			base_name += f.number + " " 
  		end
  	end
  	return base_name
  end

end
