module EventsHelper
  def day_and_time(event)
    event.starts_at.strftime("%B %d at %I:%M %P")
  end
  def private?
    status == 'private'
  end
end
