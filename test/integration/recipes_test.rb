require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname:"Ivo", email: "ivo@example.com") 
    @recipe = Recipe.create(name: "Vegetable saute", description: "Great vegetable saute, add vegetable and all", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "Chicken saute", description: "Great chicken dish")
    @recipe2.save
  end
  

  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
  
   test "should get recipes listing" do
     get recipes_path
     assert_template "recipes/index"
     assert_match @recipe.name, response.body
     assert_match @recipe2.name, response.body
   end
end
