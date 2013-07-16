class Recipe {
  double id;
  String name;
  int rating;
  double totalCookTime;
  String thumbUrl;
  int calories;
  String ingredientsList;
  String yield;
  String servings;
  String sourceSite;
  String recipeUrl;
  Map attributes;
  
  Recipe(this.id, this.name, this.rating, this.totalCookTime, this.thumbUrl, this.calories, this.ingredientsList,
    this.yield, this.servings, this.sourceSite, this.recipeUrl);  
  
  Map toJson() {
    return {"id": id, "name": name, "rating": rating, totalCookTime: totalCookTime, 
      thumbUrl: thumbUrl, calories: calories, ingredientsList: ingredientsList, yield: yield, 
      servings: servings, sourceSite: sourceSite, recipeUrl: recipeUrl, attributes: attributes};
  }
}