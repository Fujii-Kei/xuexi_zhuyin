class QuestionsController < ApplicationController
  def show
    @result = Result.new
    @category = Category.find(params[:category_id])
    @questions = @category.questions.order(:id)
  end
end
