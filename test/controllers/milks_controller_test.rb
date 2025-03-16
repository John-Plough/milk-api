require "test_helper"

class MilksControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/milks.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Milk.count, data.length
  end

  test "create" do
    assert_difference "Milk.count", 1 do
      post "/milks.json", params: { name: "lake", width: 800, height: 600 }
      assert_response 200
    end
  end

  test "show" do
    get "/milks/#{Milk.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal [ "id", "name", "color", "created_at", "updated_at" ], data.keys
  end

  test "update" do
    milk = Milk.first
    patch "/milks/#{milk.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Milk.count", -1 do
      delete "/milks/#{Milk.first.id}.json"
      assert_response 200
    end
  end
end
