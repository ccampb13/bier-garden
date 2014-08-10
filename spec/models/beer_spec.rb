RSpec.describe Beer do
  it { should belong_to :region }
  it { should validate_presence_of :brewery }
  it { should validate_presence_of :region }
end
