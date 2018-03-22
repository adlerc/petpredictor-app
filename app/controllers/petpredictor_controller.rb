require 'rest-client'

class PetpredictorController < ApplicationController
  protect_from_forgery except: [:index, :show, :create]

  def show
    response = RestClient::Request.execute(
      method: :get,
      url: ENV["predictorservice_api_host"]+'/petpredictor?height='+params[:height].to_s+'&weight='+params[:weight]
    )
    @json = JSON.parse(response.body)
    @json["dog_count"] = @json["dogorcat"] == 0 ? 1 : 0
    @json["cat_count"] = @json["dogorcat"] == 0 ? 0 : 1
    guess = @json["dogorcat"] == 0 ? "DOG" : "CAT"
    @message = "You are a " + guess.to_s + " person!"
  end

  def create
    iscorrect = params["correct"]
    @message = iscorrect == "true" ? "Awesome sauce!" : "Sorry...My bad."
  
    request_body = generate_json_body(params)
    RestClient.post( 
      ENV["predictorservice_api_host"]+'/petpredictor', 
      request_body,
      {content_type: :json, accept: :json}
    )
    
    render "confirm"
  end

  private
    def generate_json_body(params)
      params.delete("correct")
      params.delete("controller")
      params.delete("action")    
      params_hash =  { :raw_stats => params }
      return params_hash.to_json
    end

end