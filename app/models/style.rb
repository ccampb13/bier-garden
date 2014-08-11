class Style < ActiveRecord::Base
  belongs_to :beer
  has_one :experience

  validates_presence_of :name, :style, :abv, :beer

  def consumed?
    experience.present? && experience.consumed?
  end
end
