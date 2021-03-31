class Car < ApplicationRecord
  belongs_to :colour

  validates :make, :model, :build_date, :colour_id, presence: true
  validate :less_than_four_years

  private 

  def less_than_four_years
    return if build_date.blank?
    today = Time.current.to_date

    if (today.year - build_date.year) > 4
      errors.add(:build_date, "car cannot be older than 4 years")
    end
  end
end