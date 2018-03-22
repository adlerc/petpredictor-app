require 'test_helper'

class PetPredictorControllerTest < ActionDispatch::IntegrationTest

  def setup
    @petpredictorapp_url = "/petpredictor"
    @querystring = "?height=65&weight=130"

    stub_request(:get, ENV["predictorservice_api_host"]+@petpredictorapp_url+@querystring).
      with(  headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip, deflate',
        'Host'=>'api.ac-dev.com:3010',
        'User-Agent'=>'rest-client/2.0.2 (darwin14.5.0 x86_64) ruby/2.4.1p111'
        }).
      to_return(:status => 200, :body => %Q(
        {
          "height": "65",
          "weight": "130",
          "dogorcat": 0
        }
      ), :headers => {})

    stub_request(:post, ENV["predictorservice_api_host"]+@petpredictorapp_url).
      with(
        body: "{\"raw_stats\":{\"height\":\"65\",\"weight\":\"150\",\"dog_count\":\"0\",\"cat_count\":\"1\"}}",
        headers: {
        'Accept'=>'application/json',
        'Accept-Encoding'=>'gzip, deflate',
        'Content-Length'=>'76',
        'Content-Type'=>'application/json',
        'Host'=>'api.ac-dev.com:3010',
        'User-Agent'=>'rest-client/2.0.2 (darwin14.5.0 x86_64) ruby/2.4.1p111'
        }).
      to_return(status: 201, body: "", headers: {})

  end

  test "should get index" do
    get @petpredictorapp_url
    assert_response :success
  end

  test "should get show" do
    get @petpredictorapp_url + "/show"+@querystring
    assert_response :success
  end

  test "should post on create" do
    post @petpredictorapp_url, 
      params: {"height"=>"65", "weight"=>"150", "dog_count"=>"0", "cat_count"=>"1", "correct"=>"true"}
    assert_response :success
  end

end