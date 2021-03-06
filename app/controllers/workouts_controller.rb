class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
    @user = current_user
  end

  def create
    @workout = Workout.new(workout_params)
    @workout[:user_id] = current_user.id
    if @workout.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @workout = Workout.find(params[:id])
    @exercises = Exercise.where(workout_id: @workout.id)
    @cardios = Cardio.where(workout_id: @workout.id)
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to root_path
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.update_attributes(workout_params)
    @workout.save
    redirect_to root_path
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :time, :hours, :minutes, :seconds, :workout_type, :notes)
  end
end
