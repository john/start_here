class HomeController < ApplicationController
  
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
