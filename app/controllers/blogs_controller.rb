class BlogsController < ApplicationController

  def index
    @blogs=Blog.where(published: true).order(created_at: :desc)
  end

  def show
    @blog=Blog.find(params[:id])
  end

end
