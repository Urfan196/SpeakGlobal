class LessonsController < ApplicationController
    before_action :find_lesson, only: [:show, :edit, :update, :destroy]

    def index
        @student = User.find(params[:student_id])
        @lessons = @student.teacher_lesson.all
    end

    def show
    end

    def new
        @lesson = Lesson.new
        @student = User.find(params[:student_id])
        @teacher = User.find(params[:teacher_id])
    end

    def create
        Lesson.create(lesson_params)
        redirect_to current_user
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def lesson_params
        params.require(:lesson).permit(:date, :language_id, :student_id, :teacher_id)
    end

    def find_lesson
        @lesson = Lesson.find(params[:id])
    end
end

