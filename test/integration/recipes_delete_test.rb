require 'test_helper'

class RecipesDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "ken", email: "ken@examplel.com",
                          password: "password", password_confirmation: "password")
    @recipe = Recipe.create(name: "vegetable saute", description: "greate vegetable saute, add vegetable and oil", chef: @chef)

    test "successfully delete a recipe" do
      sign_in_as(@chef, "password")
      get recipes_path(@recipe)
      assert_template 'recipe/show'
      assert_select 'a[href=?]', recipe_path(@recipe), text: "Delete this recipe"
      assert_difference 'Recipe.count', -1 do
        delete recipe_path(@recipe)
      end
      assert_redirected_to recipes_path
      assert_not flash.empty?
    end
  end
end
