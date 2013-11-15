module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def select_dates
    dates = []
    dates << ["Today (#{0.days.from_now.strftime("%A")})", "#{0.days.from_now.to_date}"]
    dates << ["Tomorrow (#{1.days.from_now.strftime("%A")})", "#{1.days.from_now.to_date}"]
    (2..6).each do |i|
      dates << ["#{i.days.from_now.strftime("%A, %b %e")}", "#{i.days.from_now.to_date}"]
    end
    dates
  end

  def select_times
    times = []
    times << ["ASAP (45-60 min)", "Placeholder"]
    (3..6).each do |i|
      times << ["#{(i*30).minutes.from_now.round_off(15.minutes).strftime("%l:%M %P")}", "Placeholder"]
    end
    times
  end
end