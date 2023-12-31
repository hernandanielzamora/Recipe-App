class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    if @food.save
      flash[:notice] = 'Food was successfully added to the table.'
      redirect_to foods_path
    else
      flash[:alert] = 'Food was not added to the table.'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    puts params[:id]
    @food.destroy
    flash[:notice] = 'Food was successfully deleted.'
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
