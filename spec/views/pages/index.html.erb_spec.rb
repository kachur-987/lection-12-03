require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  let!(:user){create(:user)}
  let!(:profile){create(:profile, user: user)}
  
  before :each do
   @posts = assign(:post, [Post.create!(title: "title1", body: "body1", user: user),
                           Post.create!(title: "title2", body: "body2", user: user)])
   # controller.instance_variable_set(:@posts, @posts)
  end
  
  it "should show a post title" do
    allow(view).to receive_messages(:will_paginate => nil)
    render
    expect(@posts[0].title).to eq('title1')
    expect(rendered).to include 'title1' 
  end
  
  it "should show a link to post title" do
    allow(view).to receive_messages(:will_paginate => nil)
    render
    expect(rendered).to include '<a href="/posts/1">title1</a>'
    expect(rendered).to include '<a href="/posts/2">title2</a>' 
  end
  
  it "should show a post body" do
    allow(view).to receive_messages(:will_paginate => nil)
    render
    expect(@posts[0].body).to eq('body1')
    expect(rendered).to include 'body1' 
  end
  
  it "should show a link to new post" do
    allow(view).to receive_messages(:will_paginate => nil)
    render
    expect(rendered).to include '<a href="/posts/new">New Post</a>'
  end
  
  it "should show user email" do
    allow(view).to receive_messages(:will_paginate => nil)
    render
    expect(@posts[0].user.email).to eq('tester@test.com')
    expect(rendered).to include 'tester@test.com'
  end
end
