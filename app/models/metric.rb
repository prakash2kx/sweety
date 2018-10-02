class Metric < ApplicationRecord
  belongs_to :user
  validates :glucose_unit,
            :presence => {:message => "Glucose unit can't be blank." },
            :inclusion => {:in => (0..9).to_a, :message => "Value should be between 1 to 9"},
            :numericality => { only_integer: true }

  validate :max_count, on: :create

  DAY_LIMIT = 4

  def max_count
    metrics = Metric.where(user_id: self.user_id, created_at: Date.today.beginning_of_day..Date.today.end_of_day )
    errors.add(:max_count, "Maximum 4 entries per day") if metrics.count >= DAY_LIMIT
  end

  def self.add_glucose_metrics(m_params,user_id)
    create(user_id: user_id, glucose_unit: m_params["glucose_unit"])
  end

  def self.generate_report(from,to,uid)
    where(user_id: uid ,created_at: from..to).order("created_at desc")
  end

end
