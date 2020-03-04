function Person(first, last, age, gender, interests) {
  this.name = { 'first': first, 'last': last };
  this.age = age;
  this.gender = gender;
  this.interests = interests;
}

Person.prototype.bio = function() {
  console.log(this.name.first + ' ' + this.name.last + ' is ' + this.age + ' years old. He likes ' + this.interests[0] + ' and ' + this.interests[1] + '.');
};
Person.prototype.greeting = function() {
  console.log('Hi! I\'m ' + this.name.first + '.');
};
Person.prototype.farewell = function() {
  console.log(this.name.first + ' has left the building. Bye for now!');
};

function Teacher(first, last, age, gender, interests, subject) {
  Person.call(this, first, last, age, gender, interests);
  this.subject = subject;
}

Teacher.prototype = Object.create(Person.prototype);
Teacher.prototype.constructor = Teacher;
Teacher.prototype.greeting = function() {
  var prefix;

  if(this.gender === 'male' || this.gender === 'Male' || this.gender === 'm' || this.gender === 'M') {
    prefix = 'Mr.';
  } else if(this.gender === 'female' || this.gender === 'Female' || this.gender === 'f' || this.gender === 'F') {
    prefix = 'Mrs.';
  } else {
    prefix = 'Mx.';
  }

  console.log('Hello. My name is ' + prefix + ' ' + this.name.last + ', and I teach ' + this.subject + '.');
};
