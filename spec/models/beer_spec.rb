RSpec.describe Beer do
  it { should belong_to :region }
  it { should have_many :styles }
  it { should validate_presence_of :brewery }
  it { should validate_presence_of :region }
  it { should validate_presence_of :location }
  it { should validate_presence_of :description }
end
