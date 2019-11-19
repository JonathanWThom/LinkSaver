# typed: false
describe User do
  it { should have_many :links }
  it { should have_many :tags }
end
