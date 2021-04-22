require 'rails_helper'
RSpec.describe RecipesFacade, type: :class do
  it 'can parse recipe data' do
    
    recipe_info = File.read('./spec/fixtures/recipe_view.json')
    allow(RecipesService).to receive(:recipe_view).and_return(recipe_info)
    results = RecipesFacade.parse_recipe_details(id)

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
    allow(RecipesService).to receive(:recipe_search).and_return([{:title=>"African Chicken Peanut Stew", :image=>"https://spoonacular.com/recipeImages/716268-312x231.jpg", :id=>716268, :cuisine=>"African", :calories=>1204.74},
     {:title=>"Boozy Bbq Chicken", :image=>"https://spoonacular.com/recipeImages/635675-312x231.jpg", :id=>635675, :cuisine=>nil, :calories=>723.74},
     {:title=>"Baked Fried Chicken With Cauliflower Mash", :image=>"https://spoonacular.com/recipeImages/633624-312x231.jpg", :id=>633624, :cuisine=>"Southern", :calories=>660.56},
     {:title=>"Whole Chicken Dinner", :image=>"https://spoonacular.com/recipeImages/665261-312x231.jpg", :id=>665261, :cuisine=>nil, :calories=>1105.41},
     {:title=>"Roasted Butterflied Chicken w. Onions & Carrots", :image=>"https://spoonacular.com/recipeImages/716427-312x231.jpg", :id=>716427, :cuisine=>nil, :calories=>674.98},
     {:title=>"Baked Chicken In Roasting Bag", :image=>"https://spoonacular.com/recipeImages/633524-312x231.jpg", :id=>633524, :cuisine=>nil, :calories=>489.46},
     {:title=>"Curried Chickpeas and Vegetables", :image=>"https://spoonacular.com/recipeImages/641072-312x231.jpg", :id=>641072, :cuisine=>nil, :calories=>341.08},
     {:title=>"Leek and Chicken Soup", :image=>"https://spoonacular.com/recipeImages/649430-312x231.jpg", :id=>649430, :cuisine=>nil, :calories=>595.35},
     {:title=>"Beef Green Chile Stew", :image=>"https://spoonacular.com/recipeImages/634618-312x231.jpg", :id=>634618, :cuisine=>nil, :calories=>377.69},
     {:title=>"Turbo Chicken", :image=>"https://spoonacular.com/recipeImages/663971-312x231.jpg", :id=>663971, :cuisine=>nil, :calories=>729.9},
     {:title=>"Beer Can Chicken, Country Style Vegetables with Roasted Garlic",
      :image=>"https://spoonacular.com/recipeImages/634753-312x231.jpg",
      :id=>634753,
      :cuisine=>nil,
      :calories=>821.35},
     {:title=>"Classic Matzo Ball Soup", :image=>"https://spoonacular.com/recipeImages/639616-312x231.jpg", :id=>639616, :cuisine=>nil, :calories=>634.92},
     {:title=>"Chicken Suya", :image=>"https://spoonacular.com/recipeImages/716342-312x231.jpg", :id=>716342, :cuisine=>nil, :calories=>523.01},
     {:title=>"Quick Chicken Enchilada Soup", :image=>"https://spoonacular.com/recipeImages/657579-312x231.jpg", :id=>657579, :cuisine=>"Mexican", :calories=>485.6},
     {:title=>"Skillet Roasted Chicken & Potatoes", :image=>"https://spoonacular.com/recipeImages/660220-312x231.jpg", :id=>660220, :cuisine=>nil, :calories=>738.08},
     {:title=>"Slow Cooker Chicken Verde Enchilada", :image=>"https://spoonacular.com/recipeImages/660286-312x231.jpg", :id=>660286, :cuisine=>"Mexican", :calories=>842.81},
     {:title=>"Light and Chunky Chicken Soup", :image=>"https://spoonacular.com/recipeImages/649985-312x231.jpg", :id=>649985, :cuisine=>nil, :calories=>430.08},
     {:title=>"Steamy Creamy Mushroom Risotto", :image=>"https://spoonacular.com/recipeImages/157375-312x231.jpg", :id=>157375, :cuisine=>"Mediterranean", :calories=>959.68},
     {:title=>"Simple Roast Chicken", :image=>"https://spoonacular.com/recipeImages/660133-312x231.jpg", :id=>660133, :cuisine=>nil, :calories=>681.39},
     {:title=>"Oven Braised Lemon Chicken", :image=>"https://spoonacular.com/recipeImages/654184-312x231.jpg", :id=>654184, :cuisine=>nil, :calories=>206.1},
     {:title=>"Italian Chicken With Pepper", :image=>"https://spoonacular.com/recipeImages/648097-312x231.jpg", :id=>648097, :cuisine=>"Mediterranean", :calories=>490.47},
     {:title=>"Baked Chicken with Cinnamon Apples", :image=>"https://spoonacular.com/recipeImages/633538-312x231.jpg", :id=>633538, :cuisine=>nil, :calories=>611.15},
     {:title=>"Chicken Arrozcaldo", :image=>"https://spoonacular.com/recipeImages/637942-312x231.jpg", :id=>637942, :cuisine=>nil, :calories=>482.88},
     {:title=>"Chicken Piri Piri with Spicy Rice", :image=>"https://spoonacular.com/recipeImages/638252-312x231.jpg", :id=>638252, :cuisine=>nil, :calories=>776.66},
     {:title=>"Murgh Tandoori", :image=>"https://spoonacular.com/recipeImages/652602-312x231.jpg", :id=>652602, :cuisine=>nil, :calories=>586.59},
     {:title=>"Easy Baked Chicken", :image=>"https://spoonacular.com/recipeImages/710766-312x231.jpg", :id=>710766, :cuisine=>nil, :calories=>356.19},
     {:title=>"Chili Lime Chicken Burgers", :image=>"https://spoonacular.com/recipeImages/638566-312x231.jpg", :id=>638566, :cuisine=>"American", :calories=>406.88},
     {:title=>"Easy Chicken Tandoori", :image=>"https://spoonacular.com/recipeImages/641904-312x231.jpg", :id=>641904, :cuisine=>"Indian", :calories=>187.62},
     {:title=>"Chicken Enchilada Salad Wraps", :image=>"https://spoonacular.com/recipeImages/638074-312x231.jpg", :id=>638074, :cuisine=>"Mexican", :calories=>520.5},
     {:title=>"Masala Raisin Chicken", :image=>"https://spoonacular.com/recipeImages/651184-312x231.jpg", :id=>651184, :cuisine=>"Indian", :calories=>318.53},
     {:title=>"Chicken Stew For The Soul", :image=>"https://spoonacular.com/recipeImages/638343-312x231.jpg", :id=>638343, :cuisine=>nil, :calories=>274.25},
     {:title=>"SLOW COOKER CHICKEN GUMBO SOUP", :image=>"https://spoonacular.com/recipeImages/660283-312x231.jpg", :id=>660283, :cuisine=>"Creole", :calories=>237.86},
     {:title=>"Karahi Chicken", :image=>"https://spoonacular.com/recipeImages/648746-312x231.jpg", :id=>648746, :cuisine=>nil, :calories=>885.85},
     {:title=>"Easy Chicken Pot Pie", :image=>"https://spoonacular.com/recipeImages/641901-312x231.jpg", :id=>641901, :cuisine=>nil, :calories=>177.04},
     {:title=>"Curry and Sage Roast Chicken", :image=>"https://spoonacular.com/recipeImages/641110-312x231.jpg", :id=>641110, :cuisine=>"Indian", :calories=>564.34},
     {:title=>"Steamed Chicken With Soy-Ginger Sauce", :image=>"https://spoonacular.com/recipeImages/661556-312x231.jpg", :id=>661556, :cuisine=>nil, :calories=>486.05},
     {:title=>"Peruvian Roast Chicken", :image=>"https://spoonacular.com/recipeImages/655793-312x231.jpg", :id=>655793, :cuisine=>nil, :calories=>477.07},
     {:title=>"Bbq Chicken and Goat Cheese Ravioli", :image=>"https://spoonacular.com/recipeImages/634481-312x231.jpg", :id=>634481, :cuisine=>"Mediterranean", :calories=>549.61},
     {:title=>"Blackened Cajun Chicken", :image=>"https://spoonacular.com/recipeImages/635263-312x231.jpg", :id=>635263, :cuisine=>"Creole", :calories=>446.66},
     {:title=>"Creamy Chicken Orzo Soup", :image=>"https://spoonacular.com/recipeImages/640619-312x231.jpg", :id=>640619, :cuisine=>nil, :calories=>383.1},
     {:title=>"Chicken Enchilada Casserole", :image=>"https://spoonacular.com/recipeImages/715394-312x231.jpg", :id=>715394, :cuisine=>"Mexican", :calories=>285.78},
     {:title=>"Chicken In A Pot", :image=>"https://spoonacular.com/recipeImages/638125-312x231.jpg", :id=>638125, :cuisine=>nil, :calories=>595.86},
     {:title=>"chicken marbella", :image=>"https://spoonacular.com/recipeImages/667707-312x231.jpg", :id=>667707, :cuisine=>nil, :calories=>687.31},
     {:title=>"Creamy White Chili", :image=>"https://spoonacular.com/recipeImages/640722-312x231.jpg", :id=>640722, :cuisine=>"American", :calories=>628.06},
     {:title=>"Easy Chicken Fajita Enchiladas", :image=>"https://spoonacular.com/recipeImages/715532-312x231.jpg", :id=>715532, :cuisine=>"Mexican", :calories=>627.01},
     {:title=>"Chicken and White Bean Chili", :image=>"https://spoonacular.com/recipeImages/637932-312x231.jpg", :id=>637932, :cuisine=>"American", :calories=>417.14},
     {:title=>"Fried Bee Hoon/ Vermicelli", :image=>"https://spoonacular.com/recipeImages/643669-312x231.jpg", :id=>643669, :cuisine=>nil, :calories=>154.48},
     {:title=>"Three-Cup Chicken", :image=>"https://spoonacular.com/recipeImages/663392-312x231.jpg", :id=>663392, :cuisine=>nil, :calories=>402.79},
     {:title=>"Easy Slow Cooker Whole Chicken With Rosemary", :image=>"https://spoonacular.com/recipeImages/1062882-312x231.jpg", :id=>1062882, :cuisine=>nil, :calories=>426.44},
     {:title=>"Moroccan Spiced Chicken Under A Brick", :image=>"https://spoonacular.com/recipeImages/652442-312x231.jpg", :id=>652442, :cuisine=>nil, :calories=>487.63},
     {:title=>"Crispy Buttermilk Fried Chicken", :image=>"https://spoonacular.com/recipeImages/640803-312x231.jpg", :id=>640803, :cuisine=>"Southern", :calories=>259.6},
     {:title=>"Grilled Chicken & Corn Red Potato Salad", :image=>"https://spoonacular.com/recipeImages/645621-312x231.jpg", :id=>645621, :cuisine=>nil, :calories=>314.04},
     {:title=>"Baked Crusty Chicken", :image=>"https://spoonacular.com/recipeImages/633569-312x231.jpg", :id=>633569, :cuisine=>nil, :calories=>366.21},
     {:title=>"Lemon and Garlic Slow Roasted Chicken", :image=>"https://spoonacular.com/recipeImages/649495-312x231.jpg", :id=>649495, :cuisine=>nil, :calories=>346.77},
     {:title=>"How to Make Grilled Beer Butt Chicken", :image=>"https://spoonacular.com/recipeImages/1184955-312x231.jpg", :id=>1184955, :cuisine=>nil, :calories=>487.02},
     {:title=>"Herb Roasted Chicken", :image=>"https://spoonacular.com/recipeImages/646673-312x231.jpg", :id=>646673, :cuisine=>nil, :calories=>424.73},
     {:title=>"Zucchini Chicken Omelette", :image=>"https://spoonacular.com/recipeImages/665734-312x231.jpg", :id=>665734, :cuisine=>nil, :calories=>210.29},
     {:title=>"Lemon, Garlic and Thyme Roast Chicken – Quick and Easy Method",
      :image=>"https://spoonacular.com/recipeImages/649827-312x231.jpg",
      :id=>649827,
      :cuisine=>nil,
      :calories=>428.77},
     {:title=>"Chicken Chili With Black Eyed Peas", :image=>"https://spoonacular.com/recipeImages/638026-312x231.jpg", :id=>638026, :cuisine=>"American", :calories=>188.49},
     {:title=>"Pan-Browned Chicken", :image=>"https://spoonacular.com/recipeImages/654443-312x231.jpg", :id=>654443, :cuisine=>nil, :calories=>227.87},
     {:title=>"Asian Orange Noodle Salad", :image=>"https://spoonacular.com/recipeImages/632856-312x231.jpg", :id=>632856, :cuisine=>"Asian", :calories=>25.68},
     {:title=>"Chicken Fajitas By Mommie Cooks", :image=>"https://spoonacular.com/recipeImages/638085-312x231.jpg", :id=>638085, :cuisine=>"Mexican", :calories=>158.44},
     {:title=>"Gluten And Dairy Free Alfredo Lasagna", :image=>"https://spoonacular.com/recipeImages/644785-312x231.jpg", :id=>644785, :cuisine=>"Mediterranean", :calories=>349.95},
     {:title=>"How to Make an Easy Chicken Enchilada", :image=>"https://spoonacular.com/recipeImages/1171085-312x231.jpg", :id=>1171085, :cuisine=>"Mexican", :calories=>321.37},
     {:title=>"Salsa Verde Chicken Tamales", :image=>"https://spoonacular.com/recipeImages/659180-312x231.jpg", :id=>659180, :cuisine=>"Mexican", :calories=>121.98},
     {:title=>"Asian Chicken Salad", :image=>"https://spoonacular.com/recipeImages/632821-312x231.jpg", :id=>632821, :cuisine=>"Asian", :calories=>132.71},
     {:title=>"Simple Rendang", :image=>"https://spoonacular.com/recipeImages/660128-312x231.jpg", :id=>660128, :cuisine=>nil, :calories=>79.46},
     {:title=>"Buffalo Chicken Wings Wonton Wraps", :image=>"https://spoonacular.com/recipeImages/636411-312x231.jpg", :id=>636411, :cuisine=>"Chinese", :calories=>38.57}])

      ingredient = 'chicken'
      recipes = RecipesFacade.parse_recipe_search(ingredient)

      recipes.each do |recipe|
        expect(recipe.title).to be_a(String)
        expect(recipe.image).to be_a(String)
        expect(recipe.cuisine).to be_a(String).or eq(nil)
        expect(recipe.id).to be_a(Integer)
        expect(recipe.calories).to be_a(Numeric)
      end
  end

end
