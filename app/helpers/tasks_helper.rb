module TasksHelper
  def tag_link(tag_list)
    tag_list.split(' ').map{ |t| link_to t,tag_tasks_path(t) }.join(' ').html_safe
  end
end
