class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def show
    @answers = Answer.all
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)

    if @question.save
      redirect_to @question, notice: "Question was successfully updated."
    else
      render :show
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice:  "question deleted"
  end


  private

  def set_question
      @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title,:description)
  end
end
