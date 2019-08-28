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

    # it "return img_tag with share button" do
    #   expect(share_telegram(result)).to eq("<img onclick=shareTelegram(&#39;https://fast-reaches-12261.herokuapp.com&#39;, &#39;Source link on...39;) style=cursor: pointer src=https://img.icons8.com/color/48/000000/telegram-app.png />")
    # end
    #
    # it "return img_tag with share email" do
    #   expect(share_email(result)).to eq("<img onclick=\"shareEmail(&#39;https://fast-reaches-12261.herokuapp.com&#39;, &#39;Source link one:%.../link&#39;)\" style=\"cursor: pointer\" src=\"https://img.icons8.com/color/48/000000/gmail.png\" />")
    # end
  end
end
