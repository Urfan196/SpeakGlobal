class LessonsController < ApplicationController
    before_action :find_lesson, only: [:show, :edit, :update, :destroy]
    before_action :authorized

    def index
        @student = User.find(current_user.id)
        @student_l = Lesson.where(student_id: current_user.id)
        @teacher_l = Lesson.where(teacher_id: current_user.id)
    end

    def show
    end

    def new
        @lesson = Lesson.new
        @student = User.find(params[:student_id])
        @teacher = User.find(params[:teacher_id])
    end

    def create
        lesson = Lesson.create(lesson_params)
        if lesson.valid?
            redirect_to current_user 
        else
            @lesson = Lesson.new
            @student = User.find(params[:lesson][:student_id])
            @teacher = User.find(params[:lesson][:teacher_id])
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
        @lesson.destroy
        redirect_to lessons_path
    end

    private

    def lesson_params
        params.require(:lesson).permit(:date, :language_id, :student_id, :teacher_id)
    end

    def find_lesson
        @lesson = Lesson.find(params[:id])
    end
end

