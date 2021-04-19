module ApplicationHelper
  def get_priority(priority)
    case priority
    when "high"
      I18n.t("enums.task.priority.high")
    when "mid"
      I18n.t("enums.task.priority.mid")
    when "low"
      I18n.t("enums.task.priority.low")
    end
  end
end

