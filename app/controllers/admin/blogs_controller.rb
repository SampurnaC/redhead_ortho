class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs=Blog.order(created_at: :desc)
  end

  def show
  end

  def new
    @blog=Blog.new
  end

  def create
    @blog=Blog.new(blog_params)
    if @blog.save
      redirect_to admin_blogs_path, notice: "Blog created successfully."
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to admin_blogs_path, notice: "Blog updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to admin_blogs_path, notice: "Blog deleted successfully."
  end

  def set_blog
    @blog=Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :slug, :published, :published_at)
  end
end
