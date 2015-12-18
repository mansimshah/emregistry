class BusinessesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_business, only: [:show, :edit, :update, :destroy]

	def index
		@businesses = current_user.businesses if current_user.businesses.present?
	end

	def new
		@user = current_user
		@business = Business.new 
	end

	def create
		@business = Business.new(business_params.merge(user_id: current_user.id))
		if @business.save
			flash[:notice] = "New business information is created successfully."
			redirect_to business_path(@business)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @business.update(business_params)
			flash[:notice] = "Business information is updated successfully."
			redirect_to business_path(@business)
		else
			render 'edit'				
		end	
	end
	
	def show
	end	

	def destroy
		@business.destroy
		redirect_to businesses_path
	end

	private

	def set_business
		@business = Business.find(params[:id])
	end	

	def business_params
		params.require(:business).permit(:name, :category, :image, :is_active, :user_id, locations_attributes: [:id, :location, :type_of_services, :description, :cost, :is_active, :business_id, :_destroy])
	end	
end