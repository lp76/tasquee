class EventMailer < ActionMailer::Base
  default :from => "tasquee@sensible.it"

  def send_task(task)
    @task = task
    mail(:to => task.user.email,
         :subject => "[Tasquee] Ti e' stato assegnato un nuovo task!")
  end

  def send_updated_task(task)
    @task = task
    mail(:to => task.user.email,
         :subject => "[Tasquee] Un task assegnato e' stato aggiornato!")
  end

  def send_deleted_task(task)
    @task = task
    mail(:to => task.user.email,
         :subject => "[Tasquee] Un task assegnato e' stato cancellato!")
  end

  def send_email_to_admin(task, admin)
    @task = task
    mail(:to => admin.email,
          :subject => "[Tasquee] Un task e' stato completato!")
  end

  def send_appointment(appointment)
    @appointment = appointment
    mail(:to => appointment.user.email,
         :subject => "[Tasquee] Ti e' stato assegnato un nuovo appuntamento!")
  end

  def send_updated_appointment(appointment)
    @appointment = appointment
    mail(:to => appointment.user.email,
         :subject => "[Tasquee] Un appuntamento assegnato e' stato aggiornato!")
  end

  def send_deleted_appointment(appointment)
    @appointment = appointment
    mail(:to => appointment.user.email,
         :subject => "[Tasquee] Un appuntamento assegnato e' stato cancellato!")
  end

end
