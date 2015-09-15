require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    # hash denotes instance level method,
    # period denotes class level method

    get :index, format: :json
    # this is a get request to the index, expecting json

    items = JSON.parse(response.body, symbolize_names: true)
    item  = items.first

    assert_response :success
    assert_equal 2, items.count
    assert_equal "apple", item[:name]
    assert_equal "is a fruit", item[:description]
    # can also do assert_equal 200, response.status
  end

  test "#show" do
    get :show, format: :json, id: Item.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "banana", item[:name]
    assert_equal "is another fruit", item[:description]
  end

  test "#create" do
    item_params = { name: "Arya", description: "is blind" }

    post :create, format: :json, item: item_params

    item = Item.last
    json_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Arya", json_item[:name]
    assert_equal "is blind", json_item[:description]
    assert_equal "Arya", item.name
    assert_equal "is blind", item.description
  end

  test "#update" do
    item_params = { name: "Stavi", description: "has no fingers" }
    old_item = Item.first

    post :update, format: :json, id: Item.first.id, item: item_params

    new_item = Item.find(old_item.id)

    assert_response :success
    assert_equal "Stavi", new_item.name
    assert_equal "has no fingers", new_item.description
    refute_equal old_item.name, new_item.name
    refute_equal old_item.description, new_item.description
  end

  test "#destroy" do
    assert_difference('Item.count', -1) do
      delete :destroy, format: :json, id: Item.first.id
    end
    # 1st arg = code that is run, 2nd arg = value of difference

    assert_response :success
  end
end
