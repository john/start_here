require 'spec_helper'

describe "layouts/application.html.haml" do
  
  before(:each) do
    render
  end
  
  describe "head" do
    it "has a title" do
      rendered.should have_tag('title')
      rendered.should have_tag('nav')
    end

    # it "displays site nav" do
    #   rendered.should have_tag('ul#site_nav') do
    #     with_tag 'li', :count => 3
    #     with_tag 'a', :href => community_url
    #     with_tag 'a', :href => wotd_url
    #     with_tag 'a', :href => random_word_url
    #   end
    # end
    
  end
  
end