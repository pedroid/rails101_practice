class PostsController < ApplicationController
	before_action :find_group
	before_action :authenticate_user!
	before_action :member_required, only: [:new, :create]
	def new
		@post = @group.posts.new
	end
	def create
		@post = @group.posts.build(post_params)
		@post.author = current_user	
		if @post.save
			redirect_to group_path(@group), notice:"add success!"
		else 
			render :new
		end
	end
	def edit
		@post = current_user.posts.find(params[:id])	
	end
	def update
		@post = current_user.posts.find(params[:id])
		
		if @post.update(post_params)
			redirect_to group_path(@group), notice: "edit success!"
		else
			render :edit
		end
	end
	def destroy
		@post = current_user.posts.find(params[:id])
		
		@post.destroy
		redirect_to group_path(@group), alert:"deleted!"
	end

	private
	def find_group
		@group = Group.find(params[:group_id])
	end
	
	def post_params
		params.require(:post).permit(:content)
	end
	
	def member_required
		if !current_user.is_member_of?(@group)
			flash[:warning] = "you are not a member of this group"
			redirect_to group_path(@group)
		end
	end
end
