require 'rails_helper'
RSpec.describe RecipesFacade, type: :class do
  it 'can parse recipe data' do

    recipe_info = JSON.parse(File.read('./spec/fixtures/recipe_view.json'), symbolize_names: true)
    allow(RecipesService).to receive(:recipe_view).and_return(recipe_info)
    results = RecipesFacade.parse_recipe_details(123)

    expect(results).to be_a(RecipePoro)

    expect(results.id).to eq(123)

    expect(results.name).to eq("Tart Green Salad with Avocado Dressing")

    expect(results.image).to eq("https://spoonacular.com/recipeImages/123-556x370.jpg")

    expect(results.recipe_info).to eq("You can never have too many side dish recipes, so give Tart Green Salad with Avocado Dressing a try. One portion of this dish contains about <b>3g of protein</b>, <b>4g of fat</b>, and a total of <b>71 calories</b>. This recipe serves 4 and costs $1.73 per serving. It is a good option if you're following a <b>gluten free, primal, whole 30, and pescatarian</b> diet. 7 people were impressed by this recipe. Head to the store and pick up coarse salt and ground pepper, avocado, coarse salt and ground pepper, and a few other things to make it today. From preparation to the plate, this recipe takes roughly <b>15 minutes</b>. All things considered, we decided this recipe <b>deserves a spoonacular score of 64%</b>. This score is solid. Try <a href=\"https://spoonacular.com/recipes/grapefruit-avocado-salad-with-pepita-green-goddess-dressing-857435\">grapefruit-avocado salad with pepita green goddess dressing</a>, <a href=\"https://spoonacular.com/recipes/fava-green-+-snap-pea-salad-with-creamy-avocado-dressing-18301\">Fava Green + Snap Pea Salad With Creamy Avocado Dressing</a>, and <a href=\"https://spoonacular.com/recipes/tuna-nicoise-salad-with-avocado-green-goddess-dressing-835966\">Tuna Nicoise Salad with Avocado Green Goddess Dressing</a> for similar recipes.")

    expect(results.instructions[0].step).to eq(1)
    expect(results.instructions[0].instruction).to eq("Combine salad ingredients in a large bowl and season with salt and pepper.")

    expect(results.ingredients[0].name).to eq("anchovies")
    expect(results.ingredients[0].amount).to eq("1.0 ")

    expect(results.nutrients[0].name).to eq("Calories")
    expect(results.nutrients[0].amount).to eq("66.64 kcal")
  end

  it 'can parse search data' do

    recipes_info = JSON.parse(File.read('./spec/fixtures/search_results.json'), symbolize_names: true)
    allow(RecipesService).to receive(:recipe_search).and_return(recipes_info)

    results = RecipesFacade.parse_recipe_search("chicken")



      results.each do |recipe|
        expect(recipe).to be_a(Result)
        expect(recipe.title).to be_a(String)
        expect(recipe.image).to be_a(String)
        expect(recipe.cuisine).to be_a(String).or eq(nil)
        expect(recipe.id).to be_a(Integer)
        expect(recipe.calories).to be_a(Numeric)
      end
  end

end
