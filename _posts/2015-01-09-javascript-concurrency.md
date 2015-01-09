---
layout: post
title: JavaScript concurrency
tags: [javascript, concurrency]
comments: true
---

I've known JavaScript to be a single-threaded concurrent language but recently it struck me that I didn't entirely
understand what that meant. I understood that with a concurrent model, tasks are interleaved versus running at the same
time as with parallelism. But what constituted a task? Was it the individual computational instructions themselves? I
set out to find out exactly what this meant by throwing together some code.

Here's my first whack at it:

{% highlight javascript %}
// test.js

console.log('a1');

setTimeout(function willThisFireConcurrently() {
	console.log('b1');
	console.log('b2');
	console.log('b3');
}, 0);

console.log('a2');
console.log('a3');
{% endhighlight %}

I wanted to see whether the log outputs would be interleaved in some fashion. To my surprise, I found the
following output:

{% highlight bash %}
$ node test.js 
a1
a2
a3
b1
b2
b3
{% endhighlight %}

So it appears execution is still procedural. The method `willThisFireConcurrently` is only called after the outer scope
has finished executing. Just to be sure, I decided to introduce some code to add in a delay:

{% highlight javascript %}
// test2.js

console.log('a1');

setTimeout(function willThisFireConcurrently() {
	console.log('b1');
	console.log('b2');
	console.log('b3');
}, 0);

console.log('a2');
console.log('a3');

var now = Date().getTime();
while(new Date().getTime() < now + 2000){ } // noop loop for 2 seconds
{% endhighlight %}

Sure enough, the output remains the same:

{% highlight bash %}
$ node test2.js 
a1
a2
a3
b1
b2
b3
{% endhighlight %}


This differs from the way JavaScript seems to handle I/O and user interaction. When it comes to network events or a user
clicking on a button on your website, these are all handled in a separate thread. Once the computation in that thread
is complete, it returns back to JavaScript's running context and continues to execute your code in that single thread.
This is also true for NodeJS, for example, when reading from a file. Reading a file does not block the thread of your
application. That's handled in a separate thread and the result again is returned to the context of your application's
thread. However, your application will always run in a single thread. That is, unless you use Web Workers, but that's
a discussion for another blog post.
