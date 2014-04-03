class PostsController < ApplicationController

	skip_before_filter :verify_authenticity_token 

	def index
	  @posts = Post.all
     if params[:search] 
     	@posts = Post.search(params[:search]).reorder("created_at DESC") 
     else 
     	@posts = Post.reorder("created_at DESC")
     end
	end

	def admi
		@posts = Post.reorder("created_at DESC")
	end

	def report
		@posts = Post.reorder("created_at DESC")
	end

	def new
		@post = Post.new
	end

	def like
		@post = Post.find(params[:id])
		if @post.like == nil
		   @post.like = 1
		   redirect_to '/'
		else
           @post.like = @post.like + 1
           redirect_to '/'
		end
		@post.save
	end

	def create
		@post = Post.new
		@post.title = params[:post][:title]
		@post.text = params[:post][:text]
		@post.like = 0

		if @post.save 
			redirect_to '/', notice: 'The post has been created sucesfully'
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
    end

    def show
       @post = Post.find(params[:id])
    end

	def update
		@post = Post.find(params[:id])
		@post.title = params[:post][:title]
		@post.text = params[:post][:text]
		

        if  @post.like == 0 ||  @post.like == nil
          @post.like =0
        end

		if @post.save 
			redirect_to '/', notice: 'The post has been updated sucesfully'
		else
			render 'edit'
		end	

	end

	def delete
        @post =  Post.find(params[:id])
        @post.destroy

        redirect_to '/post/admi', notice: 'The post has been deleted sucesfully'
	end
    
    def  search
    	@posts = Post.search(params[:search_text])
    end
end