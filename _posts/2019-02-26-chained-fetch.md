---
layout: post
title:  "How to chain fetch calls"
date:   2019-02-26 00:00:00 -0600
categories: web development webdev javascript promises
---
Sometimes you want to have data based on previously loaded data, so your variables depend on the previous fetch call, then is when we use promise chaining.

```javascript
const BASE_URL = 'https://swapi.co/api';

function getPersonWithHomeworld(personId){
  // Declare an empty variable to save the received response
  let person;
  // It's important to return the main fetch since it will return
  // a promise, if the promise is not returned then the result
  // belongs just to the scope of this function
  return fetch(`${BASE_URL}/people/${personId}`)
    .then(response => response.json())
    .then(_person => {
      // Assign the parsed response to our declared variable
      person = _person;
      // Do a fetch using the homeworld url from the received person
      return fetch(person.homeworld);
    })
    .then(response => response.json())
    .then(homeworld => {
      // Overwrite the homeworld value with the parsed response
      // from the fetch call
      person.homeworld = homeworld;
      return person;
    });
}

// Call the function, because it returns a promise, we need to
// threat it like that using .then
getPersonWithHomeworld(1)
  .then(console.log);
```