module EventsHelper
  def display_user_week(user, week)
    html = ""
    html += content_tag :th, "#{user.name}"
    for day in week do
      html += "<td id='#{user.name}_#{I18n.l day}_Morning'"
      if day == Date.today
        html += " class='today'"
      end
      html += ">"
      html += load_user_tasks_on_morning(user, day)
      html += load_user_appointments_on_morning(user, day)
      html += "</td>"
      html += "<td id='#{user.name}_#{I18n.l day}_Afternoon'"
      if day == Date.today
        html += " class='today'"
      end
      html += ">"
      html += load_user_tasks_on_afternoon(user, day)
      html += load_user_appointments_on_afternoon(user, day)
      html += "</td>"
    end
    html.html_safe
  end

  private

  def load_user_tasks_on_morning(user, day)
    html = ""
    for task in user.tasks.morning.by_date(day) do
        html += "<p class='#{task.id}'>"
        html += link_to "[T]" + task.customer.name, task, :remote => true, :class => "remote_link #{task.id} #{task.status.downcase}"
        html += "</p>"
    end
    for task in user.tasks.all_day.by_date(day) do
        html += "<p class='#{task.id}'>"
        html += link_to "[T]" + task.customer.name, task, :remote => true, :class => "remote_link #{task.id} #{task.status.downcase}"
        html += "</p>"
    end
    html.html_safe
  end

  def load_user_tasks_on_afternoon(user, day)
    html = ""
    for task in user.tasks.afternoon.by_date(day) do
        html += "<p class='#{task.id}'>"
        html += link_to "[T]" + task.customer.name, task, :remote => true, :class => "remote_link #{task.id} #{task.status.downcase}"
        html += "</p>"
    end
    for task in user.tasks.all_day.by_date(day) do
        html += "<p class='#{task.id}'>"
        html += link_to "[T]" + task.customer.name, task, :remote => true, :class => "remote_link #{task.id} #{task.status.downcase}"
        html += "</p>"
    end
    html.html_safe
  end

  def load_user_appointments_on_morning(user, day)
    html = ""
    for app in user.appointments.morning.by_date(day) do
      html += "<p class='#{app.id}'>"
      html += link_to app.customer.name, app, :remote => true, :class => "remote_link #{app.id}"
      html += "</p>"
    end
    for app in user.appointments.all_day.by_date(day) do
      html += "<p class='#{app.id}'>"
      html += link_to app.customer.name, app, :remote => true, :class => "remote_link #{app.id}"
      html += "</p>"
    end
    html.html_safe
  end

  def load_user_appointments_on_afternoon(user, day)
    html = ""
    for app in user.appointments.afternoon.by_date(day) do
      html += "<p class='#{app.id}'>"
      html += link_to app.customer.name, app, :remote => true, :class => "remote_link #{app.id}"
      html += "</p>"
    end
    for app in user.appointments.all_day.by_date(day) do
      html += "<p class='#{app.id}'>"
      html += link_to app.customer.name, app, :remote => true, :class => "remote_link #{app.id}"
      html += "</p>"
    end
    html.html_safe
  end

end
