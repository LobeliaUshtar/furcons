class FurconsController < ApplicationController
	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, except: [:index, :show]

	def index
		@furcons = Furcon.send(furcons_scope)
	end

	def show
		@furcon = Furcon.find(params[:id])
	end

	def edit
		@furcon = Furcon.find(params[:id])
	end

	def update
		@furcon = Furcon.find(params[:id])
		if @furcon.update(furcon_params)
			redirect_to @furcon, notice: "Furcon successfully updated!"
		else
			render :edit
		end
	end

	def new
		@furcon = Furcon.new
	end

	def create
		@furcon = Furcon.new(furcon_params)
		if @furcon.save
			redirect_to @furcon, notice: "Furcon successfully created!"
		else
			render :new
		end
	end

	def destroy
		@furcon = Furcon.find(params[:id])
		@furcon.destroy
		redirect_to furcons_url, alert: "Furcon successfully deleted!"
	end

private
	def furcon_params
		furcon_params = params.require(:furcon).permit(:name, :website, :location, :theme, :starts_on, :ends_on, :prereg_by, :charities, :guest_of_honor, :image_file_name)
	end

	def furcons_scope
		if params[:scope].in? %w(past upcoming_prereg everything upcoming recent)
			params[:scope]
		else
			:upcoming
		end
	end

end