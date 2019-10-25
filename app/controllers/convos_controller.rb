class ConvosController < ApplicationController
  before_action :authorized, except: [:new, :create, :index]
  before_action :privacy?, except: [:new, :create, :index]
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @convos = @lesson.convos
  end

  def new
    @convo = Convo.new
  end

  def create
    @convo = Convo.new(convo_params)
    if @convo.save
      @lesson= Lesson.find(params[:convo][:lesson_id])
      @convos = @lesson.convos
      render "convos/index"
    else
      render :new
    end
  end

  private

  def convo_params
    params.require(:convo).permit(:message, :lesson_id)
  end

  def privacy?
    if !(student_id == current_user.id || teacher_id == current_user.id)
      redirect_to(user_path(current_user))
    end
  end
end
