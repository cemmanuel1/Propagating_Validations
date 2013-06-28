class Event < ActiveRecord::Base
  validates :organizer_name, presence: {message: "Must enter a your name"}
  validates :organizer_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Not a valid email address" }
  validates :title, uniqueness: { message: "Title already in use"}
  validates :title, presence: { message: "Must enter a title"}
  validates :date, presence: { message: "Must enter a date"}
  validate :future_date

  def future_date
    if date.present? && date > Date.today
      errors.add(:date, "Date must be in the future")
    end
  end

end
