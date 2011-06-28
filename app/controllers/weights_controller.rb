class WeightsController < ApplicationController
  before_filter :authenticate

  def create
    @weight = current_user.weights.build(params[:weight])
    if @weight.save
      flash[:success] = "Weight created!"
      redirect_to root_path
    else
      @feed_items = []      
      render 'pages/home'
    end
  end


  def destroy
      @result = Weight.destroy(params[:id])
  end
end
