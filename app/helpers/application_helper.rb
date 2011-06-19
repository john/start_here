module ApplicationHelper
  
  def site_nav
    items = []
    items << link_to('phu')
    items << link_to('bar')
    items << link_to('blah')
    items << link_to('blarg')
    items.join(' &nbsp; &#183; &nbsp; ').html_safe
  end
  
  def footer
    items = []
    items << link_to('home', root_path)
    items << link_to('about', about_path)
    items << link_to('terms', terms_path)
    items << link_to('privacy', privacy_path)
    items.join(' &nbsp; &#183; &nbsp; ').html_safe
  end
  
end
