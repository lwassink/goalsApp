class GoalsController < ApplicationController
  before_action :require_sign_in
  before_action :require_owner, only: [:destroy, :update, :edit]
  before_action :redirect_if_private_and_not_user, except: [:index, :new, :create]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.valid?
      @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_url(@goal.user)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def index
    @goals = Goal.all.where(private: false)
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  private

  def goal_params
    params.require(:goal).permit(:title,:body,:completed, :private)
  end

  def require_owner
    goal = Goal.find(params[:id])
    redirect_to goals_url unless goal.user == current_user
  end

  def redirect_if_private_and_not_user
    goal = Goal.find(params[:id])
    if goal.private && goal.user != current_user
      redirect_to goals_url
    end
  end
end
