# Contact_Tech_Test

## Summary

Contact holds a lot of data about the talent we work with – their location, age, hair colour, eye colour, complexion, etc. We often need to filter a big list of talent based on certain criteria – for example, the location they're based in.

We'd like you to build a program that accepts two inputs:

- A JSON array of talent, containing objects with `name`, `location` and `date_of_birth` attributes
- A location to filter by

The program should then filter the array of supplied talent, and output the names of talent whose location matches the location supplied. The supplied location should be considered case-insensitive, and the order in which names are outputted is not important.

## Example

For example, given:

- The following JSON data:

```jsx  
[  
  {  
    "name": "Homer Simpson",  
    "location": "Springfield",  
    "date_of_birth": "1956-05-12"  
  },  
  {  
    "name": "Frank Reynolds",  
    "location": "Philidelphia",  
    "date_of_birth": "1944-11-17"  
  },  
  {  
    "name": "Diane Nguyen",  
    "location": "Los Angeles",  
    "date_of_birth": "1980-03-19"  
  },  
  {  
    "name": "Krusty the Clown",  
    "location": "SpringField",  
		"date_of_birth": "1957-10-29"  
  }  
]  
```

- A location of `Springfield`

Your program should output:

```  
Homer Simpson  
Krusty the Clown  
```  

It’s fine for the data to be hard-coded in your solution, either in the script or read in from a file on disk - there’s no need to use a database. Feel free to use the sample data above in your solution.

## Planning
### User Stories

As user,  
So I can find someone by location,  
I would like to be able to search the data for a set location

As a user,  
So I can amend the data,  
I would like to be able to import my own data 

As a user,  
So a case difference will not affect my search,  
I would like the search to be case insensitive

As a user,
So I can find all people fitting this location search,
I would like a list of all people fitting the search to be returned

### Process

My process was to firstly decide on some user stories that I would use to structure the application. I also decided to add in the user story of being able to import your own data (which I have implimented by allowing the file path for the JSON to be changed) as this allows for easier usage new files which may include different data.

Then I finished a working application, and decided to refactor this. I also decided to split my one class into 3 classes, adding a printer class to format and print the returned names, and a data sourcer class to retrieve and parse the data, and allow changing of data sources.

Finally, I added in tests to manage malformed JSON data in 3 forms - where the name was blank, the JSON was fully invalid (malformed_data_2.json) and where there were multiple keys (malformed_data.json), and ensured this raised the appropriate errors. 

To do this, I added the duplicate_checking class, which simply checks for any duplicate keys in a single entry in the JSON eg. `{"name": "Homer", "name": "Marge"}` and raises an error if this is the case.

I typically would not document easily readable classes/methods, however have done so in this case as linting gem I'm using recommended to do so, and this tech test asked for strong documentation.

## How to use
### Set up
1. Load up IRB or a REPL of your choice   
2. Require the location_filter.rb file:  
  - If using PRY: load './lib/location_filter.rb'  
  - If using IRB: require './lib/location_filter.rb'  
3. Instantiate a new LocationFilter class in your REPL using the following line of code:  
`location_filter = LocationFilter.new`
4. Make a search by location as listed in the 'Commands' section below!

### Commands
- To find a set of people with a given location:  
`find_people(location)`

- To amend the path of the data you'd like to look in:  
`amend_source_location(path)`  

The path should be relative to the source folder of `location_filter.rb`  

E.g to change to the file `example_data_2.json` in this folder use `location.amend_source_location('./example_data_2.json')`

## Feature Test
Set up the application as stated above, and input the following into your terminal:

`find_people('Springfield')`

You will see an output similar to the one stated in the example.