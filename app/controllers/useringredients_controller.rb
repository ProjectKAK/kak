class UseringredientsController < ApplicationController

  def index
    @useringredients = Useringredient.all

    respond_to do |format|
      format.html
      format.json { render json: @useringredient}
    end
  end

	def new
		@useringredient = Useringredient.new
	end

	def create
      @useringredient = Useringredient.create(useringredient_params)
    	@useringredient.save
  	   redirect_to useringredient_path(@useringredient.id)
     end

	def show
		 @useringredient = Useringredient.find(params[:id])
  	 render :show
	end

end

private

	def useringredient_params
  		params.require(:useringredient).permit(:name)
  end
