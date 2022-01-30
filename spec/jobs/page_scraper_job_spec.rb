# frozen_string_literal: true

describe PageScraperJob do
  describe "#perform" do
    context "link is found" do
      let(:link) do
        create(
          :link,
          address: ExternalRequestHelpers::HELLO_WORLD_ADDRESS,
          html: nil,
          page_title: nil,
        )
      end

      before do
        stub_hello_world_response
        stub_allowed_link_response
        PageScraperJob.perform_now(link.id)
      end

      it "sets page title on link" do
        expect(link.reload.page_title).to eq "Hello World"
      end

      it "sets page html on link" do
        expect(link.reload.html).to match /this is a fake webpage/
      end
    end

    it "does not raise if link is not found" do
      expect { PageScraperJob.perform_now(999) }.to_not raise_exception
    end
  end
end
