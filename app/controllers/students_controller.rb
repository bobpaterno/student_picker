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

  def select
    
  end

  protected

  def student_params
    params.require(:student).permit(:name)
  end
end
