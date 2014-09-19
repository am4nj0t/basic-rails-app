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
  	@comment = current_user.comments.build(comment_params)
    @comment.post = @post 
  	authorize @comment 

  	if @comment.save
  		redirect_to @post, notice: "Comment was saved successfully."
  	else
  		flash[:error] = "Error creating comment. Please try again."
  		render :new
  	end		
  end	

  def destroy
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
        flash[:notice] = "Comment was removed."
        redirect_to [@post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@post]
    end
  end        
end
