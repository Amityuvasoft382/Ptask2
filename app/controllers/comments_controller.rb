class CommentsController < ApplicationController

	def create
		#debugger
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.create(comment_params)
		@comment.user_id = current_user.id
		@comment.save 
		redirect_to user_blog_path(current_user.id, @blog.id)
	end

	private

	def comment_params
		params.require(:comment).permit(:text)
	end
end
