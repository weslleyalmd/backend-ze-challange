require 'rails_helper'

RSpec.describe 'Suppliers API', type: :request do
  let!(:suppliers) { create_list(:supplier, 10) }
  let(:supplier_id) { suppliers.first.id }

  describe 'GET /suppliers' do
    before { get '/suppliers' }

    it 'returns suppliers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /suppliers/:id' do
    before { get "/suppliers/#{supplier_id}" }

    context 'when the record exists' do
      it 'returns the supplier' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(supplier_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:supplier_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Supplier/)
      end
    end
  end

  describe 'POST /suppliers' do
    let(:valid_attributes) {
      {
        supplier: {
          tradingName: "Supplier 1",
          ownerName: "Luke Skywalker",
          document: "1432132123891/0001",
          coverage_area_attributes: { 
            type: "MultiPolygon", 
            coordinates: [
              [[[30, 20], [45, 40], [10, 40], [30, 20]]], 
              [[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
            ]
          },
          address_attributes: { 
            type: "Point",
            coordinates: [-46.57421, -21.785741]
          }
        }
      }
    }

    context 'when the request is valid' do
      before { post '/suppliers', params: valid_attributes }

      it 'creates a suppliers' do
        expect(json['tradingName']).to eq('Supplier 1')
        expect(json['ownerName']).to eq('Luke Skywalker')
        expect(json['document']).to eq('1432132123891/0001')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/suppliers', params: { supplier: {tradingName: "Foobar"}} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Ownername can't be blank, Document can't be blank/)
      end
    end
  end

  describe 'PUT /suppliers/:id' do
    let(:valid_attributes) { { supplier: { tradingName: 'Supplier 1.1'} } }

    context 'when the record exists' do
      before { put "/suppliers/#{supplier_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /suppliers/:id' do
    before { delete "/suppliers/#{supplier_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end