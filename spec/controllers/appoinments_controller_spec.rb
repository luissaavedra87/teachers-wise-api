# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppoinmentsController, type: :controller do
  context 'GET appoinments #index' do
    it 'returns a success response' do
      get :index
      response.successful?
    end
  end
end
