class HomeController < ApplicationController
  stream
  
  def index
    @users = User.all
  end

  def about
  end

  def privacy
  end

  def terms
  end

end
