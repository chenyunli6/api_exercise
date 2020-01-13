class Api::V1::TrainsController < ApiController
  def index
    @trains = Train.all
    @trains = @trains.page(params[:page])
  end

  def show
    @train = Train.find_by_number!(params[:id])
  end
end
