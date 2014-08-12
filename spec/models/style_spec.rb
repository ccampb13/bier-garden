RSpec.describe Style do
  it { should belong_to :beer }
  it { should validate_presence_of :name }
  it { should validate_presence_of :style }
  it { should validate_presence_of :abv }
end
