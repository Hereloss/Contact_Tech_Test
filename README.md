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

```jsx  
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

## How to use
### Set up
### Feature Test