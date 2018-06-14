class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    if check_session?
      @jobs = Job.all
    else
      redirect_to '/users/index'
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    if !check_session?
      redirect_to '/users/index'
    end
  end

  # GET /jobs/new
  def new
    if !check_session?
      redirect_to '/users/index'
    end
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    if !check_session?
      redirect_to '/users/index'
    end
  end

  # POST /jobs
  # POST /jobs.json
  def create
    if !check_session?
      redirect_to '/users/index'
    end
    @job = Job.new(job_params)

    #Get User_id from session and store it
    @job.user_id = session["id"]

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if !check_session?
      redirect_to '/users/index'
    end
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    if !check_session?
      redirect_to '/users/index'
    end
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :opening_date, :closing_date)
    end

    def check_session?
        if session["id"] != nil
            return true
        end
        return false
    end
end
