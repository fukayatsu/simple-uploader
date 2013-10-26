require 'spec_helper'

describe "items/show" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :name => "Name",
      :original_name => "Original Name",
      :content => "",
      :size => 1,
      :download_count => 2,
      :password_digest => "Password Digest",
      :message => "MyText",
      :content_type => "Content Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Original Name/)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Password Digest/)
    rendered.should match(/MyText/)
    rendered.should match(/Content Type/)
  end
end
