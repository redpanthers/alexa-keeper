class FeedbacksController < ApplicationController
def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
        flash[:note]="Your message successfully saved"
          redirect_to static_pages_feedback_path
      UserMailer.feedback_email(@feedback).deliver_now
       
    end
  end

  private

    def feedback_params
      params.require(:feedback).permit(:name, :email, :message)
    end
end
