require 'spec_helper'

describe "items/index" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :name => "Name",
        :original_name => "Original Name",
        :content => "",
        :size => 1,
        :download_count => 2,
        :password_digest => "Password Digest",
        :message => "MyText",
        :content_type => "Content Type"
      ),
      stub_model(Item,
        :name => "Name",
        :original_name => "Original Name",
        :content => "",
        :size => 1,
        :download_count => 2,
        :password_digest => "Password Digest",
        :message => "MyText",
        :content_type => "Content Type"
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Original Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
  end
end
