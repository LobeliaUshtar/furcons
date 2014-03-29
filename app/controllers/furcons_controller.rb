class FurconsController < ApplicationController
	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, except: [:index, :show]
	before_action :set_furcon, only: [:show, :edit, :update, :destroy]

	def index
		@furcons = Furcon.send(furcons_scope)
	end

	def show
	end

	def edit
	end

	def update
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
		@furcon.destroy
		redirect_to furcons_url, alert: "Furcon successfully deleted!"
	end

private
	def furcon_params
		furcon_params = params.require(:furcon).permit(:name, :website, :location, :theme, :starts_on, :ends_on, :prereg_by, :charities, :guest_of_honor, :image_file_name, :slug)
	end

	def furcons_scope
		if params[:scope].in? %w(past upcoming_prereg everything upcoming recent)
			params[:scope]
		else
			:upcoming
		end
	end

	def set_furcon
		@furcon = Furcon.find_by!(slug: params[:id])
	end

end