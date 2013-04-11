class SamplesDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Sample.count,
      iTotalDisplayRecords: samples.total_entries,
      aaData: data
    }
  end

private

  def data
    samples.map do |sample|
      [
        link_to(sample.name, sample),        
        #h(project.created_at.strftime("%B %e, %Y"))        
        h(project.created_at.to_date)
      ]
    end
  end

  def projects
    @projects ||= fetch_projects
  end

  def fetch_projects
    projects = Projects.order("#{sort_column} #{sort_direction}")
    projects = Projects.page(page).per_page(per_page)
    if params[:sSearch].present?
      projects = projects.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    projects
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end