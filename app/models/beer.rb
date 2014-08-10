class Beer < ActiveRecord::Base
  belongs_to :region

  validates_presence_of :brewery, :region

end
