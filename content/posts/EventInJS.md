+++
date = "2017-06-27T11:00:10+09:00"
title = "Event in JS"
+++

### Preparations
* You have to know very basic things in JS

### Targets
* Beginner

### Time to read
* 10 - 15 mins

### Source code
* https://github.com/Dinwy/BlogCode

When I just get started to learn about JS, one of the biggest question was that what is the event. How computer knows that I'm sending the event? Does s/he checking every single time something is happeing or not? It was a stupid question but I think other people also ask the some question! I was suprised when I understand how computer handle that. Thanks to Ron korving who taught about this. If you already know about event in C# you don't have to read this post.

To understand the event you need to understand what is function and how it works.

~~~js
// hello function
function hello() {
	// Print Hello
	console.log('Hello');
}

// Execute the function
hello();
~~~

Look at the code above. We have a function name **hello**. If you execute the **hello** function then it will print **Hello**. How to execute this? Put round brackets next to your function hello.
I guess you already know this or by reading this you understand how this operate. Now, think about what if we have a function without round brackets. 

~~~js
// hello function
function hello() {
	// Print Hello
	console.log('Hello');
}

// Function without round brackets
hello;
~~~

Surprisingly this will not throw any errors. Because it's equal to you have a function name hello. Why talking about this obvious thing so verbosely? Behold. You've already seen the core parts of the event. You may ask when, but think deeply. Whenever you put round brackets next to function name then you execute the code and vice versa. It is the concept of the event! Now we are ready to go further so we will take a look with a small model. I'll show all the code first(You can donwload the code url with github). Next, explain these step by step.

**event.js**
~~~js
'use strict';

class EE {
	constructor() {
		this.handlers = {};
	}

	subscribe(name, fn) {
		if (this.handlers[name]) {
			this.handlers[name].push(fn);
		} else {
			this.handlers[name] = [fn];
		}
	}

	emit(name, data) {
		let targetHandler = this.handlers[name];
		if (!this.handlers[name]) { return; }

		for (let i = 0; i < targetHandler.length; i++) {
			let fn = targetHandler[i];

			fn(data);
		}
	};

	removeListener(name, fn) {
		let targetHandler = this.handlers[name];
		if (!targetHandler) { return; }

		let index = targetHandler.indexOf(fn);
		if (index !== -1) {
			targetHandler.splice(index, 1);
		}
	};

	once(name, fn) {
		let that = this;
		this.subscribe(name, function handler(data) {
			that.removeListener(name, handler);
			fn(data);
		});
	};
}

module.exports = new EE();
~~~

**main.js**
~~~js
'use strict';

const Event = require('./events.js');

function eventA (msg) {
	console.log(`eventA: Got a message, ${msg}`);
}

function eventB (msg) {
	console.log(`eventB: Got a message, ${msg}`);
}

// Add two listener which listeng the event name 'message'
Event.subscribe('message', eventA);
Event.subscribe('message', eventB);
// Listening event name 'alert'
Event.subscribe('alert', (msg) => console.log(`Got a alert, ${msg}`));

// Emit the 'message' event
Event.emit('message', 'Hello there');
console.log('------------');

// Add a listener which only listen once
Event.once('message', (msg) => console.log(`eventC: Got a message, ${msg}`));

// Emit the 'message' event
Event.emit('message', 'Are you listening?');
console.log('------------');

// Remove Event A
Event.removeListener('message', eventA);
// Emit the 'message' event again
Event.emit('message', 'Hello?');
console.log('------------');

// Emit the event
Event.emit('alert', 'Warning!');

// Results
/*
eventA: Got a message, Hello there
eventB: Got a message, Hello there
------------
eventA: Got a message, Are you listening?
eventB: Got a message, Are you listening?
eventC: Got a message, Are you listening?
------------
eventB: Got a message, Hello?
------------
Got a alert, Warning!
*/
~~~

Let's start to read this step-by-step. We have two files **event.js** and **main.js**. To make a long story short, we will store functions in the object and call it whenever we want. Let's take look at the first three parts of event.js.

**First parts of event.js**
~~~js
'use strict';

class EE {
	constructor() {
		this.handlers = {};
	}

	subscribe(name, fn) {
		if (this.handlers[name]) {
			this.handlers[name].push(fn);
		} else {
			this.handlers[name] = [fn];
		}
	}

	emit(name, data) {
		let targetHandler = this.handlers[name];
		if (!this.handlers[name]) { return; }

		for (let i = 0; i < targetHandler.length; i++) {
			let fn = targetHandler[i];

			fn(data);
		}
	};
...
}
~~~

We have a class name EE. This EE class will be instantiated with empty object name **handlers**. Which will be used to store functions. Next, EE has **subscribe** function. Which will actually push the fuctions into **handlers**. It is taking two paramters name and function. Name is identifier that decide which event will be stored. And fn parameter is function which you want to store. Last, EE has **emit** function. This will invoke the function which you've stored before by using **subscribe**. Data is what you want to hand over. If you don't understand this part clearly yet then it's time to go to the main.js and have to read the first part.

**main.js**
~~~js
'use strict';

const Event = require('./events.js');

function eventA (msg) {
	console.log(`eventA: Got a message, ${msg}`);
}

function eventB (msg) {
	console.log(`eventB: Got a message, ${msg}`);
}

// Listening to event name 'message' with two functions respectively
Event.subscribe('message', eventA);
Event.subscribe('message', eventB);
// Listening to event name 'alert'
Event.subscribe('alert', (msg) => console.log(`Got a alert, ${msg}`));

// Emit the 'message' event
Event.emit('message', 'Hello there');
...
~~~

Main.js is using event.js what we've defined. And **Event** is listening to two event *message* and *alert* respectively. On the event **message** we will listen with eventA & eventB. Which means that whenever **message** event has happend these two functions will be called. Additionally, anonymous function is listening to the event name **alert**. At the end of the code above **Event.emit** is invoking **message** event with a message *'Hello there'*. This is functionally equal to the function below.

~~~js
function anonymousFunction(msg) {
	console.log(`eventName: Got a message, ${msg}`);
}

anonymousFunction('Hello there');
~~~

This is everything about how event works. If you're still confused then think about what is in the handler variable. Currently, it will be a object contains array data like as below.

**What EE.handler contains**
~~~js
{
	'message': [eventA, eventB]
}
~~~

See how simple it is! Handler object has key **message** and 'message' have two functions eventA and eventB. This is enough but I want to give you some extra thingies. Let's look at the rest of the EE class.

**The rest parts of EE class**
~~~js
class EE {
...
	removeListener(name, fn) {
		let targetHandler = this.handlers[name];
		if (!targetHandler) { return; }

		let index = targetHandler.indexOf(fn);
		if (index !== -1) {
			targetHandler.splice(index, 1);
		}
	};

	once(name, fn) {
		let that = this;
		this.subscribe(name, function handler(data) {
			that.removeListener(name, handler);
			fn(data);
		});
	};
}
~~~

There are two functions left. Function **removeListener** and **once**. Just like as its name represents, removeListener will remove listener in **handlers** object. It will check handler array with two parameters. Name and function. So if it is able to find data with given parameters then this method will remove that. And **once** function will be called only once. After being called then it will remove itself on the list of **handlers**. Thus the result of running this code will be the same as follows.

**Results**
~~~js
// Results
/*
eventA: Got a message, Hello there
eventB: Got a message, Hello there
------------
eventA: Got a message, Are you listening?
eventB: Got a message, Are you listening?
eventC: Got a message, Are you listening?
------------
eventB: Got a message, Hello?
------------
Got a alert, Warning!
*/
~~~

Finally this is done! Now you know how event works. You could understand why people don't explain about the event. The reason why I think is it's too easy so this is regarded as don't need to be explained. Though this is really important in programming. I'm sorry that the explanations were way too verbose. I want to make a lame execuse that this was the first article I've wrote. I hope that you've understood this well enough and also this was helpful too. Bye.