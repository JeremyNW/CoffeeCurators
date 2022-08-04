//
//  RecipeDataStore.swift
//  CoffeeCurator
//
//  Created by Regina Paek on 8/4/22.
//

//import UIKit
//
//
//class RecipeDataStore {
//
//    static var recipes: [Recipe] {
//
//        let icedCoffee = Recipe(id: "", coffeeName: "Iced Coffee", ingredients: "1 lb. ground coffee, 8qt. cold water, half-and-half, sweet condensed milk or milk of your choice.", directions: "To make iced coffee, pack a glass full of ice cubes. Fill glass 2/3 full with coffee liquid. Add healthy splash of half-and-half. Add 2-3 tablespoons sweetened condensed milk (can use plain sugar instead) and stir to combine. Taste and adjust half-and-half and/or sweetened condensed milk as needed.", imageURL: "", userName: "", userImage: "")
//
//        let irishCoffee = Recipe(id: "", coffeeName: "Irish Coffee", ingredients: "2 teaspoon brown sugar, 4 oz. strong hot coffee, 1 1/2 oz. Irish whiskey, 1 oz. heavy cream, lightly whipped.", directions: "Place the brown sugar into a warm Irish coffee glass, mug, or other heatproof glass. Add the coffee and Irish whiskey. Stir until the sugar is dissolved. Float the lightly whipped heavy cream on top by slowly pouring it over the back of a spoon. Do not stir. Instead, drink the Irish coffee through the cream. Enjoy.", imageURL: "", userName: "", userImage: "")
//
//        let whiteRussian = Recipe(id: "", coffeeName: "White Russian", ingredients: "1 2/3 oz. Vodka, 1oz. fresh cream, 2/3 oz. coffee liqueur.", directions: "Pour coffee liqueur and vodka into an Old Fashioned glass filled with ice. Float fresh cream on top and stir slowly.", imageURL: "", userName: "", userImage: "")
//
//        let caramelFrappuccino = Recipe(id: "", coffeeName: "Caramel Frappuccino", ingredients: "Cold coffee, Milk, Caramel syrup, Ice, Caramel sauce, Whipped cream.", directions: "Put milk and coffee in a blender. Add caramel syrup and ice. Blend until smooth. Drizzle caramel sauce around the inside of a glass. Pour the blended frappuccino into the glass. Top with whipped cream and caramel sauce. Grab a straw! And enjoy!", imageURL: "", userName: "", userImage: "")
//
//        let caramelLatte = Recipe(id: "", coffeeName: "Caramel Latte", ingredients: "2 oz. fresh espresso, 6 oz. milk of choice, 1/2 oz. caramel syrup.", directions: "To make the milk foam without a frothing tool, fill a clean, empty mason jar with the milk, making sure not to fill the container more than halfway so you’ll have room for the airy foam. Screw the lid on the jar and give it a vigorous shake for about a minute. The milk should look foamy and have doubled in volume.Unscrew the lid from the jar and set it aside. Heat the milk jar uncovered in the microwave for 30 seconds. You’ll see that the foam has now risen to the top of the jar and looks stabilized, which means it’s ready to use.Pour the warm milk over the hot, freshly-brewed espresso or strong coffee in your mug, then use a spoon to gently scoop the extra frothy milk foam over top. Make sure to use the foam right away, as it will dissolve if left sitting out for more than a few minutes.Finish with a drizzle of caramel syrup on top. Add a sprinkle of cinnamon or cocoa powder, if desired.", imageURL: "", userName: "", userImage: "")
//
//        let chocolateCoffeeKiss = Recipe(id: "", coffeeName: "Chocolate Coffee Kiss", ingredients: "3/4 oz. coffee liqueur, 3/4 oz. Irish cream liqueur, 1/2 fluid oz. creme de cacao liqueur, 1 teaspoon brandy based orange liqueur, 1 cup hot coffee, 2 tablespoons whipped cream, 1 1/2 oz. chocolate syrup, 1 maraschino cherry.", directions: "In a coffee mug, combine coffee liqueur, Irish cream, creme de cacao and Grand Marnier. Fill mug with hot coffee. Top with a dollop of whipped cream, drizzle with chocolate syrup and garnish with a maraschino cherry.", imageURL: "", userName: "", userImage: "")
//
//        let dalgonaCoffee = Recipe(id: "", coffeeName: "Dalgona Coffee", ingredients: "1 Tablespoon instant coffee, 1 Tablespoon of brown sugar, 2 Tablespoons hot water, Milk of choice, Ice.", directions: "Place coffee, sugar and water in a larger bowl and mix on high for about 4-5 minutes until the mixture becomes foam like with peaks. If you do not have a mixer, you can hand whisk for 20-30 minutes for the same consistency. Fill a glass with ice and milk of choice and place your whipped dalgona coffee on top. Make sure to stir! You want the dalgona coffee to mix with the milk thoroughly.", imageURL: "", userName: "", userImage: "")
//
//        let cardamomCoffee = Recipe(id: "", coffeeName: "Cardamom Coffee", ingredients: "Crushed seeds from 1 cardamom pod, 3/4 cup milk, 3 Tablespoons ground coffee, Sugar.", directions: "Simmer cardamom seeds and milk in a small saucepan over medium-low heat for about 5 minutes, stirring occasionally. Heat 2/3 cup water almost to boiling. Put ground coffee in a drip cone set on a large mug. Pour water over grounds.Strain milk into coffee. Stir in sugar if you like.", imageURL: "", userName: "", userImage: "")
//
//        let turkishCoffee = Recipe(id: "", coffeeName: "Turkish Coffee", ingredients: "5-6 oz. cold water, 2 Tablespoons extra fine coffee ground, 1-3 teaspoons sugar.", directions: "Gather the ingredients.", imageURL: "", userName: "", userImage: "")
//
//        let affogato = Recipe(id: "", coffeeName: "Affogato", ingredients: "2 scoops vanilla ice cream, 2 oz. espresso or strong coffee", directions: "Add 2 scoops of ice cream to a serving bowl or glass. Add chocolate shavings or other toppings if desired. Pour 2 shots of hot espresso or strong brewed coffee over the ice cream and serve right away.", imageURL: "", userName: "", userImage: "")
//
//        return [icedCoffee, irishCoffee, whiteRussian, caramelFrappuccino, caramelLatte, chocolateCoffeeKiss, dalgonaCoffee, cardamomCoffee, turkishCoffee, affogato]
//
//    }
//}
//
//
