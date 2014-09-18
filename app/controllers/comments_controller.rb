class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(params[:comment])
  	@comment.user = current_user

  	if @comment.save
  		redirect_to @post, notice: "Comment was saved successfully."
  	else
  		flash[:error] = "Error creating comment. Please try again."
  		render :new
  	end		
  end	
end
