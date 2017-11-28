describe Tag do
  it { should belong_to :user }
  it { should have_many :categories }
  it { should have_many(:links).through(:categories) }
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of(:title) }
  it { should validate_uniqueness_of(:color) }
end
