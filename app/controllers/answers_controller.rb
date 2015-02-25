class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :upvote, :downvote, :edit, :update, :destroy]

  def index
    @answer = Answer.all
  end

  def show
  end

  def upvote
    @question = Question.find(params[:question_id])
    @answer.votes += 1
    @answer.save
    redirect_to question_path(@question)
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer.votes -= 1
    @answer.save
    redirect_to question_path(@question)
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def edit
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render 'edit'
    end
  end

  def destroy
    @answer.destroy
    redirect_to root_path
  end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
