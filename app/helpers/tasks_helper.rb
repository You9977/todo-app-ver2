module TasksHelper  
  def sortable(column, title = nil)
    title ||= column.titleize
    sort_btn = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => sort_btn}
  end   
end
