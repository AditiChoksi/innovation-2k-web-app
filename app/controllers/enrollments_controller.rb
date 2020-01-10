class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :enrollment_owner!, only: [:edit, :update, :destroy]
  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end
  
  def my_enrollments
    vid = current_user.id
    @enrollments = Enrollment.where(:volunteer_id => vid).all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = current_user.reg_enrollments.new(enrollment_params)

    #@enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to new_enrollment_path, notice: 'Enrollment was successfully created.' }
        format.json { render :new, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def enrollment_params
    params.require(:enrollment).permit(:receipt_no, :name, :college, :contact_no, :team, :year, :dept, :amt_paid, :event_name, :volunteer_id, :email)
  end

  def enrollment_owner!
    authenticate_user!
    
    if current_user.id != 1
      if @enrollment.volunteer_id != current_user.id
        redirect_to enrollments_path
        flash[:notice] = 'You do not have enough permissions to do this'
      end
    end
  end #def end

end
