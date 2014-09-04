class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "Student named #{@student.name} has been created"
    else
      flash.now[:alert] = "Student could not be created."
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def call_on(student)
    if student.nil?
      flash.notice = "Sorry, all students picked in the last hour"
      redirect_to students_path
    else
      student.last_called = Time.zone.now
      if student.save
        flash.now[:alert] = "Call on #{student.name}"
      else
        flash.now[:alert] = "Sorry, could not update student time data"
      end
      redirect_to student_path(student)
    end
  end

  def select
    student = Student.pickable.sample
    call_on(student)
  end

  protected

  def student_params
    params.require(:student).permit(:name)
  end
end
