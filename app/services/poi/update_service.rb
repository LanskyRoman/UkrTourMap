class Poi::UpdateService < Poi::CreateService
  def id
    @params[:id]
  end

  def perform!
    @poi = Poi.find(id)
    @status = @poi.update_attributes(poi_params)
  end
end
