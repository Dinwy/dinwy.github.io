+++
date = "2017-06-27T11:00:10+09:00"
title = "Event in JS"
tags = ["javascript"]
+++

<div>

### Preparations
* You have to know very basic things in JS

### Targets
* Beginner

### Time to read
* 10 - 15 mins

### Source code
* https://github.com/Dinwy/BlogCode

When I just get started to learn about JS, one of the biggest question was what is the event. How computer knows that I'm sending a event? Does computer checking for updates every single time? It was a stupid question but I think other people may ask the some question. It surprised me a lot when I found how computer handles it. Thanks to Ron korving who taught to me this. If you already know about event in C# you don't have to read this post.

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

Surprisingly this will not throw any errors. Because it's equal to you have a function name hello. Why talking about this obvious thing so verbosely? Behold. You've already seen the core parts of the event. You may ask when, but think deeply. Whenever you put round brackets next to function name then you execute the code and vice versa. It is the concept of the event! Now we are ready to go further. From here we will take a look through the small model. I'll show all the code first(You can download the code via url). You don't need to read all the code at once. Just give a glance and jump to the next. I'll explain these step by step.

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

// Add two listener which listening to the event name 'message'
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

Let's start to explain this step-by-step. We have two files **event.js** and **main.js**. File **event.js** is containing EE class which defines the event. And file **main.js** is where you use the event class. To make a long story short, we will store functions in a variable and call it whenever we want. Let's check out the first three parts of **event.js**.

**First three parts of event.js**
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

We have a class which name is EE. This EE class will be instantiated constructor which will make a with empty object named **handlers**. Clearly, **handlers** will store keys and values. Each keys will have a array value to store functions. Next, EE has **subscribe** function. Which will actually push the functions into **handlers** with a key. It will takes two parameters name and function. Name is key inside of handlers and be used as identifier. That decides which event will be stored and called. And fn parameter represents function which you want to store and call. Last, EE has **emit** function. **emit** have two parameters. Name will be used to invoke the event which you've defined before in the  **subscribe**. Data is the thing what you want to hand over to the function you've defined in **subscribe**. If you don't understand this part clearly yet then it's time to go to the main.js and have to read the first part.

**First parts of the main.js**
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

Main.js is using event.js what we've defined. And **Event** is listening to two event *message* and *alert* respectively. eventA & eventB is listening to the event **message**. Which means that whenever **message** event has been invoked then these two functions will be called and executed. Additionally, anonymous function is listening to the event name **alert**. At the end of the code above **Event.emit** is invoking **message** event with a message *'Hello there'*. This is functionally equal to the function below.

~~~js
function anonymousFunction(msg) {
	console.log(`eventName: Got a message, ${msg}`);
}

anonymousFunction('Hello there');
~~~

This is everything about how event works. If you're still confused then think about what handler variable contains. Currently, it will have key value data like as below.

**What EE.handler contains**
~~~js
{
	'message': [eventA, eventB]
}
~~~

See how simple it is! Handler object has key **message**. Also 'message' have two functions eventA and eventB. Therefore, If you invoke event 'message' by writing ```Event.Emit('message', 'Hello there')``` then it will execute eventA and eventB. Doesn't seems like I need explain about this more hence I want to explain about the rest parts of EE class. Let's take a look.

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

There are two functions left to be explained. EE class have Function **removeListener** and **once**. Just like as its name represents, removeListener will remove listener in **handlers**. It will check **handlers** object with two parameters. Name and function. So if it is able to find data with given parameters then this method will remove that. And **once** function will be called only once. After being called then it will remove itself on the list of **handlers**. Thus the result of running this code will be the same as follows.

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

Finally this is done! Now you know how event works. You could understand why people don't explain about the event. The reason why I think is it's too easy so this is regarded as don't need to be explained. Though this is really important in programming. I'm sorry that the explanations were way too verbose. I want to make a lame excuse that this was the first I've written. I hope that you've understood this well enough and also this was helpful too. Bye.