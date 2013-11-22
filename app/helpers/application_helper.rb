module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def clean_category(category)
    category.gsub(/[^0-9A-Za-z]/, '')
  end

  def select_delivery_time
    times = []
    current_time = Time.now
    opening_time = Time.now.change({hour: 17})
    closing_time = Time.now.change({hour: 21})
    available_slots = (((closing_time - opening_time)/1.minute)/30).round
    delivery_delay = 60.minutes

    if (current_time >= opening_time) && (current_time <= closing_time)
      current_time_rounded = Time.at((current_time.to_f / 15.minutes).round * 15.minutes)
      delivery_time = current_time_rounded + delivery_delay
      times << ["ASAP (45-60 min)", delivery_time.strftime("%H:%M")]
      delivery_time += 30.minutes

      # Delivery up until closing time
      while delivery_time <= (closing_time + delivery_delay)
        times << ["#{delivery_time.strftime("%l:%M %P")}", delivery_time.strftime("%H:%M")]
        delivery_time += 30.minutes
      end
    else
      # Specify delivery for the following day if already too late for same day delivery
      if current_time < opening_time
        next_day = 0
        tomorrow = ""
      elsif current_time > closing_time
        next_day = 1
        tomorrow = "Tomorrow (#{(current_time+1.day).strftime("%a")}) at "
      end

      (0..available_slots).each do |slot|
        delivery_time = opening_time + next_day.days + (slot*30).minutes
        times << ["#{tomorrow + delivery_time.strftime("%l:%M %P")}", delivery_time.strftime("%a, %m/%d/%y at %H:%M")]
      end
    end
    times
  end

  def select_dates
    dates = []
    current_time = Time.now
    closing_time = Time.now.change({hour: 21})
    if current_time <= closing_time
      dates << ["Today (#{0.days.from_now.strftime("%A")})", 0.days.from_now.to_date]
    end
    dates << ["Tomorrow (#{1.days.from_now.strftime("%A")})", 1.days.from_now.to_date]
    (2..6).each do |i|
      dates << ["#{i.days.from_now.strftime("%A, %b %e")}", i.days.from_now.to_date]
    end
    dates
  end

  def select_times
    times = []
    current_time = Time.now.change({hour: 17})
    # current_time = Time.now
    opening_time = Time.now.change({hour: 17})
    closing_time = Time.now.change({hour: 21})
    available_slots = (((closing_time - opening_time)/1.minute)/30).round
    delivery_delay = 60.minutes

    if current_time < (opening_time - delivery_delay)
      (0..available_slots).each do |slot|
        delivery_time = opening_time + (slot*30).minutes
        times << ["#{delivery_time.strftime("%l:%M %P")}", delivery_time.strftime("%H:%M")]
      end
    elsif current_time < closing_time
      current_time_rounded = Time.at((current_time.to_f / 15.minutes).round * 15.minutes)
      delivery_time = current_time_rounded + 60.minutes
      times << ["ASAP (45-60 min)", delivery_time.strftime("%H:%M")]

      while delivery_time <= closing_time
        delivery_time += 30.minutes
        times << ["#{delivery_time.strftime("%l:%M %P")}", delivery_time.strftime("%H:%M")]
      end
    else
      # What happens if it's too late to order?
    end
    times
  end
end