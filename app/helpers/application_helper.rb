module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def select_dates
    dates = []
    dates << ["Today (#{0.days.from_now.strftime("%A")})", 0.days.from_now.to_date]
    dates << ["Tomorrow (#{1.days.from_now.strftime("%A")})", 1.days.from_now.to_date]
    (2..6).each do |i|
      dates << ["#{i.days.from_now.strftime("%A, %b %e")}", i.days.from_now.to_date]
    end
    dates
  end

  def select_times
    times = []
    (2..6).each do |i|
      raw_time = (i*30).minutes.from_now
      rounded_time = Time.at((raw_time.to_f / 900).round * 900).in_time_zone("Pacific Time (US & Canada)")
      if i == 2
        times << ["ASAP (45-60 min)", rounded_time.strftime("%H:%M")]
      else
        times << ["#{rounded_time.strftime("%l:%M %P")}", rounded_time.strftime("%H:%M")]
      end
    end
    times
  end
end