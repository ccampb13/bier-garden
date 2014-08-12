# User Types

* Explorers: The people entering in the regions they visit and the beers they discover within
* Patrons: The people drinking the beers of the world

# Stories

## Explorers enter regions of the world

As an explorer
In order for my patrons to know where beer is available in the the world
I want to enter regions that might draw interest from the patrons

## Patrons view which regions to drink from
In order to aquire knowledge of the many types of beer in the world
I want be able to order beers from regions near and far

## Explores enter in a variety of breweries found within each region
As an explorer
In order to show the variety of breweries available in each region
I want to enter breweries that highlight the variety of selections in the region

## Patrons view the different breweries in the region
As a patron
In order to understand the region at a deeper level
I want to try different breweries in the area.

## Explorers enter descriptions of the breweries
As an explorer
In order for my patrons to learn about beer
I want to enter a description when I create the brewery listing

## Patrons view a beer's description

As a patron
In order to learn about the brewery
I want to read details about it's history

Acceptance Criteria:
* Patrons navigate through regions and select a beer (via it's display number) to view it's details
* Displays the beer name being looked at
* Displays the beer's style and ABV%

## Patrons marks a beer as consumed

As a patron
In order to track my progress
I want to mark a beer as experienced

Acceptance Criteria:
* This builds on the beer details screen
* Patron is prompted with "Have you experienced this beer yet? y/n"
* Beer consumption is recorded in the experience model
  * The progress (experienced / not experienced) is stored in the experience model.
* If a patron updates the selected beer as experienced, the existing achievement record is updated.
* If the beer is consumed, instead of being prompted with "Have you experienced this beer yet?" the patron is shown "You experienced this beer already.
