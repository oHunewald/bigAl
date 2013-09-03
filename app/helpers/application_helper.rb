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

  def update_stock(params)
    
  end  

  def get_project_number(pool)
    library = pool.libraries.first
    if !library.blank?
      id = library.sample_id

      sample = Sample.find(id)
      project = Project.find(sample.project.id)
      return project.name
    else
      "something"
    end
    
  end

end
