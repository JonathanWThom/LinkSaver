describe Link do
  it { should belong_to :user }
  it { should validate_presence_of :url }
end
