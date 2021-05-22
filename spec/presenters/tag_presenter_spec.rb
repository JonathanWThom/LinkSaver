# frozen_string_literal: true

describe TagPresenter do
  describe ".wrap" do
    subject { described_class.wrap([tag]).first }
    let(:tag) { build(:tag) }

    it { is_expected.to be_an_instance_of described_class }
  end

  describe "#circle_style" do
    subject { described_class.new(tag).circle_style(link) }
    let(:tag) { create(:tag, color: "#033c12") }
    let(:link) { create(:link) }

    context "link is tagged with tag" do
      before { create(:category, link: link, tag: tag) }
      it { is_expected.to eq "border: 1px solid #033c12;background-color: rgba(3,60,18, .5);" }
    end

    context "link is not tagged with tag" do
      it { is_expected.to eq "border: 1px solid #033c12;" }
    end
  end

  describe "#style" do
    subject { described_class.new(tag).style }
    let(:tag) { build(:tag, color: "#033c12") }

    it { is_expected.to eq "border: 1px solid #033c12; background-color: rgba(3,60,18, .5);" }
  end
end
