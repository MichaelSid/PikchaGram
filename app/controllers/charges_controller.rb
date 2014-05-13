class ChargesController < ApplicationController

	def new
		@post = Post.find params[:post_id]
	end

	def create
	  # Amount in cents
	  @amount = 500


	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Pickcha-Gram print',
	    :currency    => 'usd'
	  )

	  flash[:notice] = 'Thanks for the $5!'
	  redirect_to '/posts'

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end
