class PagesController < ApplicationController
  def home
  	if signed_in?
	  	names = current_user.name.split(" ")
	  	@first_name = names[0]
	  end
  end

  def help
  end

  def about
  end
end
