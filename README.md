![GitHub Logo](/extras/2.png)\
![GitHub Logo](/extras/1.png)

The folder you're going to use (tester_linux or tester_mac) needs to be in the root of your push_swap.

You also need to give permission to every folder on the macs.\
`chmod 777 *`

This is a practical test I made that tests everything you need for your push_swap project.\
It's good for testing your project, and to evaluate other people on the campus.

It shows the minimum, maximum and average results of 100 random tests of a number of args you want.\
It also shows if it's OK or KO.\
Saves in a output.txt the arguments used in the tests, if it failed and the number of instructions used.


To use it, you have to type:
<pre>
bash ./tester.sh "args"
</pre>

The "args" is the number of arguments you want to test the program.\
For example:
<pre>
bash ./tester.sh 5
</pre>

This will do 100 tests of 5 arguments, like so:
<pre>
1 2 5 4 3
2 5 1 3 4
2 5 3 1 0
2 4 3 1 5
2 1 3 4 5
1 2 3 5 4
1 2 5 6 2
(...)
</pre>

