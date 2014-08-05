# User Types

* Explorers: The people entering in the regions they visit and the beers they discover within
* Patrons: The people drinking the beers of the world

# Stories

## Explorers enter descriptions of the beers

As an explorer
In order for my patrons to learn about beer
I want to enter a description when I create the beer listing

## Patrons view a beer's description

As a patron
In order to learn a about the beer being ordered
I want to read details about the beer style

Acceptance Criteria:
* Patrons navigate through regions and select a beer (via it's display number) to view it's details
* Displays the beer name being looked at
* Displays the beer's description

## Patrons marks a beer as consumed

As a patron
In order to track my progress
I want to mark a beer as experienced

Acceptance Criteria:
* This builds on the beer details screen
* Patron is prompted with "Have you experienced this beer yet? y/n"
* Beer consumption is recorded in the achievments model
  * The progress (experienced / not experienced) is stored in the achievments model.
  * The datetime when the beer was consumed is stored.
* If a patron updates the selected beer as experienced, the existing achievement record is updated.
* If the beer is consumed, instead of being prompted with "Have you experienced this beer yet?" the patron is shown "You experienced this beer on August 14th at 14:40" (or similar).



### Models
Regions
Beer Styles
Achievments
