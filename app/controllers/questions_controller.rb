class QuestionsController < ApplicationController
	before_action :set_question, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

	def index
		@questions = Question.all
    @questions = Question.order('votes DESC')
    @question = Question.new
	end

  def show
    @answers = Answer.where(question_id: @question.id)
    @answers = Answer.order('votes DESC')
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
    @question = Question.new(title: params[:question][:title], content: params[:question][:content])

    if @question.save
      respond_to do |format|
        format.html {render :partial => "create", :locals => {question: @question}}
      end
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
