class BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end

	def new
		@user = User.find(params[:user_id])
		@blog = Blog.new
	end

	def create
		@user = User.find(params[:user_id])
		@blog = @user.blogs.create(blog_params)
		redirect_to root_path
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def show
		#debugger
		@blog = Blog.find(params[:id])
		@comment = Comment.all
	end

	def update
		@user = User.find(params[:user_id])
		@blog = @user.blogs.find(params[:id])
		@blog.update(blog_params)
		redirect_to new_user_blog_path(@user)
	end

	def destroy
		@user = User.find(params[:user_id])
		@blog = @user.blogs.find(params[:id])
		@blog.destroy
		redirect_to new_user_blog_path(@user)
	end

	def is_approved
		@blog = Blog.find(params[:blog_id])
		@blog.update(position: true)
		redirect_to root_path
	end

	private

	def blog_params
		#@blog = Blog.find(params[:id])
		params.require(:blog).permit(:title, :description)
	end
end
