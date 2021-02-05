---
layout: post
title: "Javascript ID Generator"
date: 2021-02-05 00:00:00 -0600
categories: web development webdev javascript
---

```javascript
function* idGenerator() {
  let i = 0;
  while (true) {
    const id = (i++).toString().padStart(4, "0");
    yield `department-area-${id}`;
  }
}

const id = idGenerator();

console.log(id.next().value);
console.log(id.next().value);
console.log(id.next().value);
console.log(id.next().value);
```
