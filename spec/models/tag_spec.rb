# typed: false
describe Tag do
  it { should belong_to :user }
  it { should have_many :categories }
  it { should have_many(:links).through(:categories) }
  it { should validate_presence_of :title }
end
