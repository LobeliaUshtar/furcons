class MembershipsController < ApplicationController
	before_action :set_furcon

	def set_furcon
		@furcon = Furcon.find(params[:furcon_id])
	end

	def index
		@memberships = @furcon.memberships
	end
	
	def new
		@membership = @furcon.memberships.new
	end

	def create
		@membership = @furcon.memberships.new(membership_params)
		if @membership.save
			redirect_to furcon_memberships_path(@furcon), notice: "Membership added!"
		else
			render :new
		end
	end

private
	def membership_params
		params.require(:membership).permit(:name, :swag, :prereg_fee, :reg_fee)
	end

end