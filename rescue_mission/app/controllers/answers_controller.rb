require 'pry'
class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  # => #<ActiveModel::Errors:0x007fe175f1eb50
  #  @base=#<Answer:0x007fe178be8460 id: nil, answer: "dasfasd", created_at: nil, updated_at: nil>,
  #  @details={:question=>[{:error=>:blank}]},
  #  @messages={:question=>["must exist"]}>
  # [5] pry(#<AnswersController>)> @details
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@question), notice: 'Answer was successfully created.'
    else
      notice: "Answer must be at least 50 characters long"
      render :new
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
