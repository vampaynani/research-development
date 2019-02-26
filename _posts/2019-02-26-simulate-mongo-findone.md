---
layout: post
title:  "Simulate mongo findOne with a collection of objects"
date:   2019-02-26 00:00:00 -0600
categories: web development webdev javascript data array
---
```javascript
const HEROES = [
  { id: 1, name: 'Captain America', squad: 'Avengers' },
  { id: 2, name: 'Iron Man', squad: 'Avengers' },
  { id: 3, name: 'Spiderman', squad: 'Avengers' },
  { id: 4, name: 'Superman', squad: 'Justice League' },
  { id: 5, name: 'Wonder Woman', squad: 'Justice League' },
  { id: 6, name: 'Aquaman', squad: 'Justice League' },
  { id: 7, name: 'Hulk', squad: 'Avengers' },
];

function findOne(collection, query){
  // Find will return the object that is the first ocurrence
  // when a true value is returned from the callback function
  const result = collection.find(obj => {
    // Extract the searched keys from the query object
    keys = Object.keys(query);
    // Traverse the keys array, if one of the queried keys
    // is different from the same key in the object, then 
    // this is not the object that we are looking for
    for(let i = 0; i < keys.length; i++){
      if(obj[keys[i]] !== query[keys[i]]){
        return false;
      }
    }
    return true;
  });
  return result;
}

// Call findOne passing an array and a query, with as many keys
// as we want to match
console.log(findOne(HEROES, { id: 6, squad: 'Justice League' }));
```