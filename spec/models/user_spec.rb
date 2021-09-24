# typed: false
describe User do
  it { should have_many(:links).dependent(:destroy) }
  it { should have_many(:tags).dependent(:destroy) }
end
