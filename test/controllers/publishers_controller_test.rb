require 'test_helper'

class PublishersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publisher = publishers(:one)
  end

  test 'should get index' do
    get publishers_url, as: :json
    assert_response :success
  end

  test 'should create publisher' do
    assert_difference('Publisher.count') do
      post publishers_url,
           params: { publisher: { address: @publisher.address, name: @publisher.name, phone: @publisher.phone } }, as: :json
    end

    assert_response 201
  end

  test 'should show publisher' do
    get publisher_url(@publisher), as: :json
    assert_response :success
  end

  test 'should update publisher' do
    patch publisher_url(@publisher),
          params: { publisher: { address: @publisher.address, name: @publisher.name, phone: @publisher.phone } }, as: :json
    assert_response 200
  end

  test 'should destroy publisher' do
    assert_difference('Publisher.count', -1) do
      delete publisher_url(@publisher), as: :json
    end

    assert_response 204
  end
end
