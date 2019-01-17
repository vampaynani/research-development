---
layout: post
title:  "NodeJS Binary Search Tree(distance between nodes)"
date:   2019-01-15 00:00:00 -0600
categories: computer science data structures binary search tree
---
Ejemplo de una clase de árbol binario de búsqueda agregando los métodos de _distanceBetweenNodes_ y _distanceFromAncestor_ para obtener la distancia entre nodos en un BST. Utiliza una clase nodo para guardar los datos de cada uno de los items almacenados en él.

### Clase _Node_
```javascript
class Node {
  constructor(data, left = null, right = null) {
    this.data = data;
    this.left = left;
    this.right = right;
  }
}
```

### Clase _Binary Search Tree_
```javascript
class BinarySearchTree {
  constructor() {
    this.root = null;
  }
  add(data) {
    const node = this.root;
    if (node === null) {
      this.root = new Node(data);
      return;
    }
    return this.insert(data, node);
  }
  insert(data, node) {
    if (data < node.data) {
      if (!node.left) {
        node.left = new Node(data);
        return;
      }else {
        return this.insert(data, node.left);
      }
    } else if (data > node.data) {
      if (!node.right) {
        node.right = new Node(data);
        return;
      } else {
        return this.insert(data, node.right);
      }
    } else {
      return node;
    }
  }
}
```
### Métodos a agregar
Obtener la distancia desde un nodo específico a un nodo ancestro.
```javascript
distanceFromAncestor(currentAncestor, node) {
  if(!currentAncestor || currentAncestor.data === node) {
    return 0;
  }
  if(currentAncestor.data > node) {
    return 1 + this.distanceFromAncestor(currentAncestor.left, node);
  }
  if(currentAncestor.data < node) {
    return 1 + this.distanceFromAncestor(currentAncestor.right, node);
  }
}
```
Obtener la distancia entre nodos tomando en cuenta las dos siguientes consideraciones:
1. Si el argumento _currentAncestor_ es nulo, entonces se tomará en cuenta el nodo raíz
2. el nodo 1 siempre debe ser más pequeño que el nodo 2.
```javascript
distanceBetweenNodes(currentAncestor, n1, n2) {
  if(!currentAncestor) {
    currentAncestor = this.root;
  }
  if(n1 > n2){
    let temp = n2;
    n2 = n1;
    n1 = temp;
  }
  if(currentAncestor.data > n1 && currentAncestor.data > n2){
    return this.distanceBetweenNodes(currentAncestor.left, n1, n2);
  }
  if(currentAncestor.data < n1 && currentAncestor.data < n2) {
    return this.distanceBetweenNodes(currentAncestor.right, n1, n2);
  }
  if(currentAncestor.data >= n1 && currentAncestor.data <= n2) {
    return this.distanceFromRoot(currentAncestor, n1) + this.distanceFromRoot(currentAncestor, n2);
  }
}
```
### Clase _Binary Search Tree_ con métodos agregados
```javascript
 class BinarySearchTree {
  constructor() {
    this.root = null;
  }
  add(data) {
    const node = this.root;
    if (node === null) {
      this.root = new Node(data);
      return;
    }
    return this.insert(data, node);
  }
  insert(data, node) {
    if (data < node.data) {
      if (!node.left) {
        node.left = new Node(data);
        return;
      }else {
        return this.insert(data, node.left);
      }
    } else if (data > node.data) {
      if (!node.right) {
        node.right = new Node(data);
        return;
      } else {
        return this.insert(data, node.right);
      }
    } else {
      return node;
    }
  }
  distanceFromRoot(currentAncestor, node) {
    if(!currentAncestor || currentAncestor.data === node) {
      return 0;
    }
    if(currentAncestor.data > node) {
      return 1 + this.distanceFromRoot(currentAncestor.left, node);
    }
    if(currentAncestor.data < node) {
      return 1 + this.distanceFromRoot(currentAncestor.right, node);
    }
  }
  distanceBetweenNodes(currentAncestor, n1, n2) {
    if(!currentAncestor) {
      currentAncestor = this.root;
    }
    if(n1 > n2){
      let temp = n2;
      n2 = n1;
      n1 = temp;
    }
    if(currentAncestor.data > n1 && currentAncestor.data > n2){
      return this.distanceBetweenNodes(currentAncestor.left, n1, n2);
    }
    if(currentAncestor.data < n1 && currentAncestor.data < n2) {
      return this.distanceBetweenNodes(currentAncestor.right, n1, n2);
    }
    if(currentAncestor.data >= n1 && currentAncestor.data <= n2) {
      return this.distanceFromRoot(currentAncestor, n1) + this.distanceFromRoot(currentAncestor, n2);
    }
  }
}
```
### Implementación
```javascript
let bst = new BinarySearchTree();
bst.add(8);
bst.add(3);
bst.add(4);
bst.add(10);
console.log(bst.distanceBetweenNodes(null, 10, 8));
```