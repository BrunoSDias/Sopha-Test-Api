require 'swagger_helper'

RSpec.describe 'Stores API', type: :request do

  before do
    headers['Access-Token'] = 'your-access-token'
    headers['Token-Type']   = 'Bearer'
    headers['Client']       = 'your-client-id'
    headers['Expiry']       = 'expiry-date'
    headers['Uid']          = 'user@email.com'
  end

  path '/stores/{id}' do
    put 'Updates a store' do
      security [ Bearer: [] ]
      tags 'Stores'
      consumes 'application/json'

      # Include your authentication headers here as well
      parameter name: 'Access-Token', in: :header, type: :string
      parameter name: 'Token-Type', in: :header, type: :string
      parameter name: 'Client', in: :header, type: :string
      parameter name: 'Expiry', in: :header, type: :string
      parameter name: 'Uid', in: :header, type: :string
      parameter name: :id, in: :path, type: :string, description: 'store id'

      parameter name: :store, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: ['name']
      }

      response '200', 'store updated' do
        let(:store) { { name: 'Store 1' } }
        let(:id) { 'some_store_id' }

        run_test!
      end

      response '422', 'invalid request' do
        let(:store) { { name: '' } }
        run_test!
      end
    end

    delete 'Deletes a store' do
      security [ Bearer: [] ]
      tags 'Stores'

      # Include your authentication headers here as well
      parameter name: 'Access-Token', in: :header, type: :string
      parameter name: 'Token-Type', in: :header, type: :string
      parameter name: 'Client', in: :header, type: :string
      parameter name: 'Expiry', in: :header, type: :string
      parameter name: 'Uid', in: :header, type: :string
      parameter name: :id, in: :path, type: :string, description: 'store id'

      response '204', 'store deleted' do
        let(:id) { 'some_store_id' }
        run_test!
      end

      response '404', 'store not found' do
        run_test!
      end
    end

    get 'Retrieves a store' do
      security [ Bearer: [] ]
      tags 'Stores'

      # Include your authentication headers here as well
      parameter name: 'Access-Token', in: :header, type: :string
      parameter name: 'Token-Type', in: :header, type: :string
      parameter name: 'Client', in: :header, type: :string
      parameter name: 'Expiry', in: :header, type: :string
      parameter name: 'Uid', in: :header, type: :string
      parameter name: :id, in: :path, type: :string, description: 'store id'

      response '200', 'store found' do
        let(:id) { 'some_store_id' }
        run_test!
      end

      response '404', 'store not found' do
        run_test!
      end
    end
  end

  path '/stores' do
    post 'Creates a store' do
      security [ Bearer: [] ]
      tags 'Stores'
      consumes 'application/json'

      # Include your authentication headers here
      parameter name: 'Access-Token', in: :header, type: :string
      parameter name: 'Token-Type', in: :header, type: :string
      parameter name: 'Client', in: :header, type: :string
      parameter name: 'Expiry', in: :header, type: :string
      parameter name: 'Uid', in: :header, type: :string

      parameter name: :store, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: ['name']
      }

      response '201', 'store created' do
        let(:store) { { name: 'Store 1' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:store) { { name: '' } }
        run_test!
      end
    end

    get 'Retrieves all stores' do
      security [ Bearer: [] ]
      tags 'Stores'

      # Include your authentication headers here as well
      parameter name: 'Access-Token', in: :header, type: :string
      parameter name: 'Token-Type', in: :header, type: :string
      parameter name: 'Client', in: :header, type: :string
      parameter name: 'Expiry', in: :header, type: :string
      parameter name: 'Uid', in: :header, type: :string

      response '200', 'stores found' do
        run_test!
      end
    end
  end
end
