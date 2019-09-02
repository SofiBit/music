require 'spec_helper'
require 'rails_helper'

describe ViewHelper do
  context "shares" do
    let(:result) do
       {"source_link_one"=> 'http/link', "source_link_two"=> 'http/link'}
     end

    it "return correct link" do
      correct = "Source link one:%20http/link%0ASource link two:%20http/link"
      expect(transform_links(result)).to eq(correct)
    end
  end
end
