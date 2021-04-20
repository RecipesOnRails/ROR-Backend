require 'rails_helper'
RSpec.describe RecipesFacade, type: :class do
  it 'can parse recipe data' do
    allow(RecipesService).to receive(:recipe_view).and_return({:id=>1,
 :name=>"Fried Anchovies with Sage",
 :image=>"https://spoonacular.com/recipeImages/1-556x370.jpg",
 :recipe_info=>
  "Fried Anchovies with Sage might be just the main course you are searching for. One portion of this dish contains roughly <b>37g of protein</b>, <b>11g of fat</b>, and a total of <b>384 calories</b>. This recipe serves 3 and costs $5.61 per serving. Head to the store and pick up anchovies, sage leaves, seltzer water, and a few other things to make it today. To use up the baking powder you could follow this main course with the <a href=\"https://spoonacular.com/recipes/simple-raspberry-lemon-cake-671414\">Simple Raspberry Lemon Cake</a> as a dessert. 2 people have tried and liked this recipe. From preparation to the plate, this recipe takes approximately <b>45 minutes</b>. With a spoonacular <b>score of 73%</b>, this dish is good. Try <a href=\"https://spoonacular.com/recipes/fried-sage-with-anchovies-493285\">Fried Sage With Anchovies</a>, <a href=\"https://spoonacular.com/recipes/veal-shanks-with-olives-anchovies-and-sage-597839\">Veal Shanks with Olives, Anchovies, and Sage</a>, and <a href=\"https://spoonacular.com/recipes/homemade-spaghetti-with-shallots-sage-lemons-anchovies-568523\">Homemade Spaghetti with Shallots, Sage, Lemons & Anchovies</a> for similar recipes.",
 :instructions=>
  [{:step=>1,
    :instruction=>
     "If you have not tried anchovies before - you must try them now! Get over any weird apprehensions or that its just bait or a punchline for a joke about pizza (\"extra anchovies\")! These little suckers are delicious &amp; actually good for you!"},
   {:step=>2,
    :instruction=>
     "Baked, fried &amp; grilled - they are ohh so good and worth a try. If your not up to it, then pass me your plate because I love'em!Here is my favorite - Fried Anchovies - the recipe below adds a sage leave to each piece of fish as well for an extra burst of flavor &amp; color.Fried Anchovies with Sage"},
   {:step=>3,
    :instruction=>
     "Acciughe fritte con Salvia1lb of anchovies cleaned, spine removedsage leaves (optional - if you are not a fan of sage just omit)batter1 cup of flour1 egg1 te
aspoon of salt1 teaspoon of baking powderseltzer watervegetable oil for frying"},
   {:step=>4,
    :instruction=>
     "In a bowl combine flour, eggs, salt &amp; baking powder. Slowly add in seltzer water &amp; mix until forms a thin batter. Cover with plastic &amp; set in the
 fridge for at least an hour."},
   {:step=>5, :instruction=>"Heat oil in a pot to 350 degree."},
   {:step=>6,
    :instruction=>
     "Remove batter from fridge and mix once or twice (batter will have separated).Take a sage leaf &amp; anchovy put them together &amp; dip into the batter - all
owing access batter to drip off.Fry 20 seconds a side until golden brown."},
   {:step=>7, :instruction=>"Remove from oil &amp; drain on a paper towel."},
   {:step=>8, :instruction=>"Sprinkle with salt &amp; serve immediately.Pairs great with prosecco or white wine."}],
 :ingredients=>
  [{:name=>"anchovies", :amount=>"1.0 lb"},
   {:name=>"low sodium baking powder", :amount=>"1.0 teaspoon"},
   {:name=>"egg", :amount=>"1.0 "},
   {:name=>"wheat flour", :amount=>"1.0 cup"},
   {:name=>"sage", :amount=>"1.0 leaves"},
   {:name=>"salt", :amount=>"1.0 teaspoon"},
   {:name=>"sparkling water", :amount=>"3.0 servings"},
   {:name=>"vegetable oil", :amount=>"3.0 servings"}],
 :nutrients=>
  [{:name=>"Calories", :amount=>"384.09 kcal"},
   {:name=>"Fat", :amount=>"10.53 g"},
   {:name=>"Saturated Fat", :amount=>"3.6 g"},
   {:name=>"Carbohydrates", :amount=>"32.53 g"},
   {:name=>"Net Carbohydrates", :amount=>"31.37 g"},
   {:name=>"Sugar", :amount=>"0.17 g"},
   {:name=>"Cholesterol", :amount=>"145.28 mg"},
   {:name=>"Sodium", :amount=>"955.48 mg"},
   {:name=>"Protein", :amount=>"36.92 g"},
   {:name=>"Vitamin B3", :amount=>"23.67 mg"},
   {:name=>"Selenium", :amount=>"73.82 µg"},
   {:name=>"Phosphorus", :amount=>"428.72 mg"},
   {:name=>"Iron", :amount=>"7.22 mg"},
   {:name=>"Vitamin B2", :amount=>"0.66 mg"},
   {:name=>"Calcium", :amount=>"295.1 mg"},
   {:name=>"Vitamin B1", :amount=>"0.42 mg"},
   {:name=>"Folate", :amount=>"96.75 µg"},
   {:name=>"Potassium", :amount=>"778.81 mg"},
   {:name=>"Copper", :amount=>"0.43 mg"},
   {:name=>"Zinc", :amount=>"3.09 mg"},
   {:name=>"Manganese", :amount=>"0.4 mg"},
   {:name=>"Magnesium", :amount=>"73.36 mg"},
   {:name=>"Vitamin B12", :amount=>"1.07 µg"},
   {:name=>"Vitamin B5", :amount=>"1.38 mg"},
   {:name=>"Vitamin B6", :amount=>"0.26 mg"},
   {:name=>"Vitamin E", :amount=>"1.09 mg"},
   {:name=>"Fiber", :amount=>"1.16 g"},
   {:name=>"Vitamin A", :amount=>"154.8 IU"},
   {:name=>"Vitamin D", :amount=>"0.29 µg"}]})

      id = 1
      results = RecipesFacade.parse_recipe_details(id)
      expect(results.id).to eq(id)
      expect(results.name).to be_a(String)
      expect(results.recipe_info).to be_a(String)
      results.instructions.each do |instruction|
        expect(instruction).to be_a(Instruction)
      end
      results.ingredients.each do |ingredient|
        expect(ingredient).to be_a(Ingredient)
      end
      results.nutrients.each do |nutrient|
        expect(nutrient).to be_a(Nutrient)
      end
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
