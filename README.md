# Pokedex
 
## Descriptions:

### List View

The app starts and calls the pokeapi to fetch the list of pokemon. This then sets the widgets and rebuilds the list composition to show a list of pokemon in a grouped list (Grouped by evolution).

This list is complete with images for the pokemon on the left which are fetched from pokeapi.

The search bar is fully functional and you can search by either the name or the number. You can clear the results and edit text box with the bin icon.

All views in the app use a custom FadeIn animation widget which gives the views a nice coming in vibe when they are created. This applies to the list items too and if you scroll quickly down the list it looks very cool when the list items are coming in curved.

### Detail view

Once you've clicked on a pokemon the app goes and fetches the pokemons details using the pokeapi and returns a certain amount of details such as the pokemons characteristics and abilities.

The top is a collapsing toolbar and allows you to scroll and collapse the toolbar to free up more space in the view. The toolbar itself is the pokemons image within a circle. This is made to look like a Pokeball for extra design effect.

The title and types also collapse with the toolbar and are kept visible in the toolbar while the user scrolls.

The background of the list is coloured to represent the pokemons types. For example: if a pokemon is poison and grass the colours will be green and purple and this is shown as a linear gradient. If the pokemon has a single type it will show as a linear gradient with a lighter colour of the original colour.

The characteristics and abilities are both in seperate stateful widges which allows them to hold their own context. This enables them to have their own state which in turn means that an api response for both can be used and the loading indicators with proper indication of when the pokemons information is available.

The abilities and characteristics are all in seperate card views which are coded to be reusable allowing for reuse in all of the detail list items.

### The coding itself

DISCLAIMER: there is some controversial stuff in the code happening as the api is not as dynamic as i hoped. For example the setting of the pokemons evolutions in the original list. Also, the mapping of the pokemons type colours to its pokemon detail object.
