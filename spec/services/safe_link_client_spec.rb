# frozen_string_literal: true

describe SafeLinkClient do
  describe "#unsafe?" do
    subject { described_class.new(Faker::Internet.url).unsafe? }

    context "link is allowed" do
      before { stub_allowed_link_response }

      it { is_expected.to eq false }
    end

    context "link is not allowed" do
      before { stub_disallowed_link_response }

      it { is_expected.to eq true }
    end

    context "api fails" do
      before { stub_failed_allowed_link_response }

      it { is_expected.to eq false }
    end
  end
end
