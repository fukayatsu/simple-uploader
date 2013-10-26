require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :name => "MyString",
      :original_name => "MyString",
      :content => "",
      :size => 1,
      :download_count => 1,
      :password_digest => "MyString",
      :message => "MyText",
      :content_type => "MyString"
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", items_path, "post" do
      assert_select "input#item_name[name=?]", "item[name]"
      assert_select "input#item_original_name[name=?]", "item[original_name]"
      assert_select "input#item_content[name=?]", "item[content]"
      assert_select "input#item_size[name=?]", "item[size]"
      assert_select "input#item_download_count[name=?]", "item[download_count]"
      assert_select "input#item_password_digest[name=?]", "item[password_digest]"
      assert_select "textarea#item_message[name=?]", "item[message]"
      assert_select "input#item_content_type[name=?]", "item[content_type]"
    end
  end
end
