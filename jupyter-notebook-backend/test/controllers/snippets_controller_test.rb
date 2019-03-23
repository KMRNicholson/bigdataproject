require 'test_helper'

class SnippetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @snippet = snippets(:one)
  end

  test "should get index" do
    get snippets_url, as: :json
    assert_response :success
  end

  test "should create snippet" do
    assert_difference('Snippet.count') do
      post snippets_url, params: { snippet: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show snippet" do
    get snippet_url(@snippet), as: :json
    assert_response :success
  end

  test "should update snippet" do
    patch snippet_url(@snippet), params: { snippet: {  } }, as: :json
    assert_response 200
  end

  test "should destroy snippet" do
    assert_difference('Snippet.count', -1) do
      delete snippet_url(@snippet), as: :json
    end

    assert_response 204
  end
end
