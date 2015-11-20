class SurveysController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @survey = Survey.new(survey_params)
    @survey.user_id = params[:user_id]
    @survey.save
    @user.save
    if @user.save then
      redirect_to root_path
    end
  end
 
  private
    def survey_params
      params.require(:survey).permit(:test_for_response, :done_diff_response, :fam_with_response, :was_fair_response, :was_luck_response, :was_sensible_response, :own_money_response, :how_much_response, :exp_min_response, :thought_response, :stock_response, :stock_how_response, :general_comments)
    end
end
