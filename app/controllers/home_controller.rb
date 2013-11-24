class HomeController < ApplicationController
  def index
    respond_to do |format|
	    format.html { render :layout => 'presentation' }
	end
  end
end
