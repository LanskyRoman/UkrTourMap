class Poi::CreateService
  attr_reader :poi

  def initialize(params)
    @params = params
    @status = false
  end

  def perform!
    @poi = Poi.new(poi_params)
    @status = @poi.save
  end

  def poi_params
    point = Poi.factory.point(params[:lon], params[:lat])
    params.slice(:name, :description).merge(lonlat: point)
  end

  def params
    @params.require(:poi).permit(:name, :description, :lat, :lon)
  end

  def success?
    @status
  end
end
