require 'spec_helper'

module SalesEngineWeb
  describe Response do
    let(:resp1) {Response.new(:body => "whatever")}

    it 'has a body' do
      expect(resp1.body).to eq "whatever"
    end

    it 'has a default body' do
      response_x = Response.new()
      expect(response_x.body).to eq ""
    end
  end
end
