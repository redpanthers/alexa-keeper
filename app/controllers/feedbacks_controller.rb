class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    UserMailer.feedback_email(@feedback).deliver_later if @feedback.save
    redirect_to root_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
