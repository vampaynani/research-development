---
layout: post
title:  "NodeJS Linked List"
date:   2019-01-15 00:00:00 -0600
categories: computer science data structures linked list
---
Ejemplo de una clase de lista ligada con 4 métodos básicos, _push_, _insertAfter_, _delete_ y _print_. Utiliza una clase nodo para guardar los datos de cada uno de los items en ella.

### Clase _Node_
```javascript
/* Javascript program to delete a node from linked list */
class Node {
  constructor(data, next=null){
    this.data = data;
    this.next = next;
  }
 }
```

### Clase _Linked List_
```javascript
class LinkedList {
  constructor(){
    this.head = null;
  }

  //Insert a new node at the beginning
  push(newData){
    /* 1. allocate new node and put in the data  */
    const node = new Node(newData);
    /* 2. Make next of new node as head */
    node.next = this.head;
    /* 3. move the head to point to the new node */
    this.head = node;
    /* 4. return the inserted node in case you need it later */
    return node;
  }

  /* Given a node prevNodeData, insert a new node after the given prevNode */
  insertAfter(prevNode, newData) {
    /*1. check if the given prevNode is NULL */
    if(prevNode === null){
      throw 'the given previous node cannot be null';
    }
    /* 2. allocate new node and put in the data  */
    const node = new Node(newData); 
    /* 3. Make next of new node as next of prevNode */
    node.next = prevNode.next; 
    /* 4. move the next of prev_node as new_node */
    prevNode.next = node;
  }
  delete(data){
    // Store head node
    let temp = this.head;
    let prev = null;
    // If head node itself holds the key to be deleted
    if(temp !== null){
      if(temp.data === data){
        this.head = temp.next;
        delete temp;
        return; 
      }
    }
    /* Search for the key to be deleted, keep track of the
     * previous node as we need to change 'prev.next'
     */
    while(temp !== null){
      if(temp.data === data){
        break;
      }
      prev = temp;
      temp = temp.next;
    }
    // if key was not present in linked list
    if(temp === null){
      return;
    }
    // Unlink the node from linked list
    prev.next = temp.next;
    delete temp;
  }
  print(){
    let temp = this.head;
    let tempStr = '';
    while(temp){
      tempStr += `${temp.data}->`;
      temp = temp.next;
    }
    console.log(tempStr);
  }
}
```
### Implementación
```javascript
llist = new LinkedList();
llist.push(7);
let node = llist.push(1);
llist.push(3);
llist.push(2);
llist.insertAfter(node, 5);
llist.delete(3);

llist.print();
```