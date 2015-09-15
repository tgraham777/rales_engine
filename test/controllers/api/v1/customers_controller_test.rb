require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    customers = JSON.parse(response.body, symbolize_names: true)
    customer  = customers.first

    assert_response :success
    assert_equal 2, customers.count
    assert_equal "Tyler", customer[:first_name]
    assert_equal "Graham", customer[:last_name]
  end

  test "#show" do
    get :show, format: :json, id: Item.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Jai", customer[:first_name]
    assert_equal "Misra", customer[:last_name]
  end

  test "#create" do
    customer_params = { first_name: "Bob", last_name: "Jones" }

    post :create, format: :json, customer: customer_params

    customer = Customer.last

    assert_response :success
    assert_equal "Bob", customer.first_name
    assert_equal "Jones", customer.last_name
  end

  test "#update" do
    customer_params = { first_name: "Jimbo", last_name: "Superfly" }
    old_customer = Customer.first

    put :update, format: :json, id: Customer.first.id, customer: customer_params

    new_customer = Customer.find(old_customer.id)

    assert_response :success
    assert_equal "Jimbo", new_customer.first_name
    assert_equal "Superfly", new_customer.last_name
    refute_equal old_customer.first_name, new_customer.first_name
    refute_equal old_customer.last_name, new_customer.last_name
  end
end
