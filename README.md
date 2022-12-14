# Pokedex
 
## Descriptions:

### Grid view

The app starts and opens with a grid view front and center with each pokemon and pokmon number visible in each of the pokemons container. Each grid view is a material widget type so it is slightly elevated giving it a boxed card look.

The search bar is fully functional and you can search by either the name or the pokedex number. You can clear the results and edit text box with the bin icon.

You can also use the auto scroller on the right of the list to auto scroll to a generation of your choosing. You can remove this view by pressing the arrow icons. You can make it appear again by swiping left on the list.

### Detail view

Once you've clicked on a pokemon the app goes and fetches the pokemons details using the pokeapi and returns a certain amount of details such as the pokemons characteristics and abilities.

The top is a collapsing toolbar and allows you to scroll and collapse the toolbar to free up more space in the view. The toolbar itself is the pokemons image within a circle. This is made to look like a Pokeball for extra design effect.

The title and types also collapse with the toolbar and are kept visible in the toolbar while the user scrolls.

The background of the list is coloured to represent the pokemons types. For example: if a pokemon is poison and grass the colours will be green and purple and this is shown as a linear gradient. If the pokemon has a single type it will show as a linear gradient with a lighter colour of the original colour.

The characteristics and abilities are both in seperate stateful widges which allows them to hold their own context. This enables them to have their own state which in turn means that an api response for both can be used and the loading indicators with proper indication of when the pokemons information is available.

The abilities and characteristics are all in seperate card views which are coded to be reusable allowing for reuse in all of the detail list items.
