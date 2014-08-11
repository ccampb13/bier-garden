class Beer < ActiveRecord::Base
  belongs_to :region
  has_many :styles

  validates_presence_of :brewery, :region, :location, :description

end
