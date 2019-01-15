---
layout: post
title:  "Mongoose Dynamic References(Polymorphic Reference)"
date:   2018-10-04 00:00:00 -0600
categories: mongoose nodejs
---
Me encontré con un caso particular en el que un usuario podía tener uno de dos tipos de roles(alumno o profesor), los dos debían hacer login desde el mismo endpoint y para registrarse lo hacían con los mismos datos(correo, nombre y apellidos), la diferencia entre estos sucede al llenar un perfil correspondiente a su rol, por ejemplo: de uno guardamos su cuota mensual y del otro las horas de trabajo.

Para cubrir estos requerimientos con un modelo NoSQL encontré la siguiente solución como lo que mejor se acomoda al resultado requerido:
```javascript
const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
  email: String,
  password: String,
  name: String, 
  lastname: String
  role: {
    type: mongoose.Schema.Types.ObjectId,
    refPath: 'roleType'
  },
  roleType:{
    type: String,
    enum: ['Teacher', 'Student']
  }
});
```
Siendo roleType el tipo de rol(el cual a su vez es el nombre del modelo que guardará la información extra) y role el ObjectId correspondiente a la colección a la que se hace referencia.
Con esta solución fue necesario crear dos modelos extra para guardar los datos de los roles especificados en el roleType.
```javascript
const StudentRoleSchema = new mongoose.Schema({
  birthDate: Date,
  tutor: String,
  annualEnrollment: Number,
  monthlyTuition: Number
});
```
```javascript
const TeacherRoleSchema = new mongoose.Schema({
  weeklyTotalHours: Number,
  contract: String
});
```
Para utilizar este modelo, se puede seguir el código siguiente:
```javascript
const updateStudentRole = async() {
  const updateObj = {birthDate: '2018-10-04',
    tutor: 'Someone',
    annualEnrollment: 1500,
    monthlyTuition: 1200
  };

  let user = await User.findById(req.body.id);
  let studentRole = await StudentRole.findOneAndUpdate({
    _id: user.role
  }, updateObj);
  
  const student = await Student.create(updateObj);
  
  user = await User.findByIdAndUpdate(args.id, {
    role: student.id
  }, {new: true});
  
  return user;
}
```
De esta manera se pueden guardar o actualizar los datos específicos del rol y en caso de que un estudiante pase a ser profesor. Su rol puede ser actualizado sin tener que generar un nuevo usuario.