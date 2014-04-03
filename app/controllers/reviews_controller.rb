class ReviewsController < ApplicationController
	
skip_before_filter :verify_authenticity_token 

	def index
		@reviews = Review.all
	end

	def new
		@review = Review.new
	end

	def like
		@review = Review.find(params[:id])
		if @review.like == nil
		   @review.like = 1
		   redirect_to '/'
		else
           @review.like = @review.like + 1
           redirect_to '/'
		end
		@review.save
	end

	def create
		@post= Post.find(params[:post_id])
		@review = @post.reviews.create(params[:review].permit(:text))
		@review.like =0
		if @review.save 
			redirect_to '/', notice: 'La pelicula ha sido creada exitosamente'
		else
			render 'new'
		end
		
	end

end
