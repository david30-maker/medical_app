class PatientsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_receptonist, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_patient, only: [:show, :edit, :update, :destroy]

    def index
        @patients = Patient.all
    end

		def new
			@patient = Patient.new
		end

		def create
			@patient = current_userpatients.build(patient_params)
			if @patient.save
				redirect_to patient_path, notice: "Patient registered successfully"
			else
				render :new
			end
		end

		def edit
		end

		def update
			if @patient.update(patient_params)
				redirect_to patient_path, notice: "Patient updated successfully"
			else
				render :edit
			end
		end

		def destroy
			@patient.destroy
			redirect_to patient_path, notice: "Patient deleted successfully"
		end

		private

		def set_patient
			@patient = Patient.find(params[:id])
		end

		def patient_params
			params.require(:patient).permit(:name, :email, :phone, :address, :registered_at)
		end
		
		def authorize_receptonist
				redirect_to root_path, alert: "Access Denied" unless current_user.receptonist?
		end

end
