class Region < ActiveRecord::Base
  has_many :beers

  validates_format_of :name, with: /[a-zA-Z]/, message: "must include letters"
  validates_presence_of :name
  validates_length_of :name, maximum: 30, message: "must be less than 30 characters"
  validates_uniqueness_of :name, message: "already exists"
end
