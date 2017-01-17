require 'rails_helper'

RSpec.describe JobSearchesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success', vcr: false do
      allow(IndeedAPI).to receive(:search_jobs).with(q: 'software developer')
        .and_return([])
      get :index, params: { job_search: { keywords: 'software developer' } }

      expect(response).to have_http_status(:success)
      expect(IndeedAPI).to have_received(:search_jobs)
        .with(q: 'software developer')
    end
  end
end
