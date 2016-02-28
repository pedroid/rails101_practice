class PostsController < ApplicationController
	def new
		@group = Group.find(params[:group_id])
		@post = @group.posts.new
	end
	def create
		@group = Group.find(params[:group_id])
		@post = @group.posts.build(post_params)
		
		if @post.save
			redirect_to group_path(@group), notice:"add success!"
		else 
			render :new
		end
	end
	def edit
		@group = Group.find(params[:group_id])
		@post = @group.posts.find(params[:id])
	end
	def update
		@group = Group.find(params[:group_id])
		@post = @group.posts.find(params[:id])
		
		if @post.update(post_params)
			redirect_to group_path(@group), notice: "edit success!"
		else
			render :edit
		end
	end
	def destroy
		@group = Group.find(params[:group_id])
		@post = @group.posts.find(params[:id])
		
		@post.destroy
		redirect_to group_path(@group), alert:"deleted!"
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end
end
