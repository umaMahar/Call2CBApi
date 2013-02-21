require 'spec_helper'

describe ApicalltocbController do

  describe "GET 'apirequest'" do
    it "returns http success" do
      get 'apirequest'
      response.should be_success
    end
  end

end
