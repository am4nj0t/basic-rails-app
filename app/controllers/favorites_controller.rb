class FavoritesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		favorite = current.user.favorites.build(post: @post)

		authorize favorite 

		if favorite.save
			flash[:notice] = "Favorited successfully."
		else
			flash[:error] = "Unable to favorite. Please try again."
		end

		redirect_to [@post.topic, @post]
	end	

	def destroy
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.find(params[:id])

		authorize favorite

		if favorite.destroy
			flash[:success] = "Deleted favorite"
		else
			flash[:error] = "Unable to delete. Please try again."
		end	

		redirect_to [@post.topic, @post]
	end		
end
