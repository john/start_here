module ApplicationHelper
  
  def site_nav
    items = []
    items << link_to('phu')
    items << link_to('bar')
    items << link_to('blah')
    items << link_to('blarg')
    items.join(' &nbsp; &#183; &nbsp; ').html_safe
  end
  
end
