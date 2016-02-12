class WelcomeController < ApplicationController
  
  def index
  end

  #redirecting to the AuthorsController Authors.list menthod
  def authors
    redirect_to url_for(:controller => :authors, :action => :index)
  end

  def books
    redirect_to url_for(:controller => :books, :action => :index)
  end

  def summaries
    redirect_to url_for(:controller => :books, :action => :summaries)
  end

  def contact
  end
end
