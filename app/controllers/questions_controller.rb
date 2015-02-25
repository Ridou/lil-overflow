class QuestionsController < ApplicationController
	before_action :set_question, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

	def index
		@question = Question.all
	end

  def show
  end

  def upvote
    @question.votes += 1
    @question.save
    redirect_to question_path(@question)
  end

  def downvote
    @question.votes -= 1
    @question.save
    redirect_to question_path(@question)
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
