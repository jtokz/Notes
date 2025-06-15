Search
![[Pasted image 20250525105018.png]]
Knowledge
![[Pasted image 20250525104954.png]]
Uncertainty
![[Pasted image 20250525120641.png]]
Optimization
![[Pasted image 20250525121024.png]]
Machine learning
![[Pasted image 20250525121056.png]]
Neural networks
![[Pasted image 20250525121211.png]]
Language
![[Pasted image 20250525121241.png]]


Terminology

- agent: entity that perceives its environment and acts upon that environment, so for example in driving directions your agent might be some representation of a car that is trying to figure out what actions to take in order to arrive at a destination 

- state: a configuration of the agent and its environment, in the case of 15 puzzle, any state might be any one of these three examples ![[Pasted image 20250525124121.png]]

-  initial state: the state in which agent begins and then start to reason about it, to think about what actions might we apply

- actions: choices that can be made in a state, this will be a recurring theme and we can more precisely define actions as a function:
	Actions(s) returns the set of ations that can be executed in state s

how do the states and actions relate to one another?
- transition model: a description of what state results from performing any applicable action in any state and again more formaly as a function:
	Result(s,a) returns the state resulting from performing action a in state s

- state space: the set of all states reachable from the initial state by any sequence of actions by takin zero or one or two or more actions in addition to that, so we could draw a diagram where every state is represented by a game board ![[Pasted image 20250525132143.png]]
	the state space is going to look something like this. We have individual states and arrows that are connecting them and oftentimes just for simplicity, we'll simplify our representation of this entire thing as a 
	
	graph:
	![[Pasted image 20250525132658.png]]
	some sequience of nodes and edges that connect nodes, but you can think of this more abstract representation as the exact same idea, each of these little circles, or nodes, is going to represent one of the states inside of our problem and the arrows here represent the actions that we can take in any particular state, taking us from one particular state to another state, for example

simply words transition model defines what happens after we take a particular action, so the next step we need to figure out is how we know when AI is done solving the problem? The AI needs some way to know when it gets to the goal
So the next thing we'll need to encode into our artificial intelligence is a

- goal test: way to determine whether a given state is a goal state, AI need some way to encode wheter or not any state they happen to be in is a goal, and some problems might have one goal but in other more complex problems, you might imagine thet there are multiple possible goals, that there are multiple ways to solve a problem and we might not care which one the computer finds as long as does find a particular goal

However, sometimes a computer doesn't just care about finding a goal, but finding a goal well, or one with a low cost and it could be defined as

- path cost: numerical cost associated with a given path, and then tell our AI that instead of just finding a solution, some way of getting from the initial state to the goal, we'd really like to find one that minimizes this path cost that is less expensive or takes less time or minimizes some other numerical value
	we can represent this graphically, if we take a look at this graph again and imagine that each of these arrows, each of these actions that we can take from one stat to another state has some sort of number associated with it, that number being the path cost of this particular action where some of the cost for any particular action might be more expensive than the cost for some other action.
	![[Pasted image 20250525145910.png]]
	Although this will only happen in some sorts of problems, in other problems we can simplify the diagram and just assume that the cost of any particular action is the same and this is probably the case in something like the 15 puzzle where it doesnt really make a difference whether im moving right or moving left, the only thing that matters is the total number of steps that i have to take from point A to point B and each of those steps is of equal cost, we can just assume it's a some constant cost, like one![[Pasted image 20250525150350.png]]
And so this now forms the basis for what we might consider to be a search problem 	![[Pasted image 20250525150550.png]]
and find the optimal solution that has the lowest path cost among all solutions  that means is no way that we could have done better in terms of finding that solution

Node
data structure that keeps track of
- a state 
- a parent (node that generated this node)
- an action (action applied to parent to get node)
- a path cost (from initial state to node)

Every node is going to keep track of a state, the state we're currently on, and every node is also going to keep track of a parent, a parent being the state before us, or the node that we used in order to get to this current state and this is important becaus when reach the goal, we want to know what sequence of actions we used in order to get to that goal and the way we will know that is by looking at these parents to keep track of what led us to the goal, and what led us to that state, and what led us to the state befor that, so on and so forth 

Aproach
How actually begin to solve the problem?
- Start with a frontier that contains the initial state, the frontier just contains one state, the initial state because at the beginning that's the only state we know about, that's the only state that exists
- Repeat: 
	- The first thing we're going to do is if the frontier is empty, there's no solution, and we can report that there is no way to get to the goal, and that's certainly possible there're certain type of problems that an AI might try to explore and realize that there's no way to solve that problem and that's useful information for humans to know, as well
	- Otherwise what we'll do is we'll remove a node from the frontier, at the begining the frontier contains only one node but over time, the frontier might grow, it might contain multiple states, and so here we're just going to remove a single node from that frontier
	- If that node happens to be a goal, then we found a solution
	- Otherwise, what we'll need to do is we'll need to EXPAND THE NODE, and this is a term in artificial intelligence, To expand the node just means to look at atll of the neighbors of that node, in other words, consider all of the possible actions that i could take from the state that this node as representing and what nodes could i get from there. We're going to take all of those nodes, the next nodes that i can get to from this curren one I'm looking at and add those to the frontier and then we'll repeat this process
	So at a very high level, the idea is we start with a frontier that contains the initial state and we're constantly removing a node from the frontier, looking at where we can get to next, and adding those nodes to the frontier, repeating this process over and over until either we remove a node from the frontier and it contains a goal, meaning we've solved the problem Or we run into a situation where the frontier is empty, at which point we're left with no solution, so let's actually try and take the pseudocode

Example
![[Pasted image 20250525203339.png]]

What could go wrong?
![[Pasted image 20250525213234.png]]
Here for example with an unic change it could be a problem, and this is true in something like the 15 puzzle where when i slide a tile to the right, i could then slide a tile tot he left to get back to the original position and it could be going in this infinite loop where i never make any progress, so how can we solve this? by somehow keeping track of what we've already explored and the logic is going to be, well, if we've already explored the state there's no reason to go back to it. so here is going to be our 

Revised approach
a better way to approach this sort of search problem
![[Pasted image 20250525214213.png]]
One of the simplest data structures for adding and removing elements is the Stack, last in, first out data type
![[Pasted image 20250530231239.png]]
This way to search is called Depth-First Search, because you explore first the last result and continue exploring in reverse
![[Pasted image 20250530231413.png]]
There are other algorithms like Breadth-First Search which behaves very similary to depth searcg but one difference, instead of always exploring the deepest node in the search tree, breadth-first search is always going to explore the shallowest node in the frontier, so the most recent node added to the frontier is the one we will explore next, so this one uses queue data estructure, queue is first-in, first-out data type


![[Pasted image 20250531191757.png]]
![[Pasted image 20250531192537.png]]

Class maze is going to handle the process of taking a sequence, a maze like text file, and figuring out how to solve it

There are a distinction between two different types of search alogirithms: Uninformed search and informed search

Uninformed Search:
search strategy that uses no problem-specific knowledge, algorithms like DFS and BFS, two algorithms that we just looked at which are search strategies that don't use any problem specific knowledge to be able to solve the problem
DFS and BFS didn't really care about the structure of the maze or anything about the way that a maze is, in order to solve the problem, they just look at the actions available and choose from those actions and it doesn't matter whether if it's a maze or some other problem, the solution or the way that ir tries to solve the problem is really fundamentally going to be the same

Informed Search:
search strategy that uses problem-specific knowledge to find solutions more efficiently and reasoning about what knowledge might be helpful for our AI agent to knwo a little something about
Here we are going to see a specific type of search algorithm called Greedy best-first search

Greedy best first search (GBFS)
search algorithm that expands the node that is closest to the goal, as estimated by a heuristic function h(n)
This algorithm expands the node where it thinks is closest to the goal, obviously we don't know what is the best path, instead, we can use an estimate of what's closest to the goal, otherwise kwnown as a heuristic, just some way of estimating wheter or not we're close to the goal that takes a state of input and returns an estimate of how close we are to the goal 

How a heuristic function looks like in the case of a Maze problem?
![[Pasted image 20250604095506.png]]
Well the heuristic needs to solve the question, between these cells, C and D which one is better? which one would i rather be in if i'm trying to find my way to the goal? Any human could probably look at this and tell you, D looks like it's better, even if the maze is a convoluted and you haven't though about all the walls, D is probably better, and why is D better? because if you ignore the walls, D just in terms of coordinate pairs, is closer to this goal, it's fewer steps that i would need to take to get to the goal as compared to C, even if you ignore the walls, if you just know the x,y coordinate of C, and the x,y coordinate of the goal, and likewise, you know the x,y coordinate of D, you can calculate that D just geographically, ignoring the walls, looks like it's better.
And so this is the heuristic function that we're going to use, and it's something called the Manhattan distance, one specific type of heuristic
![[Pasted image 20250604100141.png]]
Where the heuristic is, how many squares vertically and horizontally and then left to right, so no allowing myself to go diagonally, just either up or right or left or down, How many steps do i need to take to get from each of these cells to the goal? Well, as it turns out, D is much closer, there are fewer steps it only needs to take six steps in order to get to that goal, again here ignoring the walls, we've relaxed the problem a little bit, we're just concerned with, if you do the math, subtract the x values from each other and the y values from each other, what is our estimate of how far we are away?
We can estimate that D is closer to the goal than C is. 

 Let's label this grap
![[Pasted image 20250604100928.png]]
With a number representing the value of this heuristic function, the value of the Manhattan distance from any of these cells.

As we can see at the top, there is a cell that has a Manhattan distance of two, only two squares away from the goal geographically, even though in practice we're going to have to take a longer path, but we don't know that yet, the heuristic is just some easy way to estimate how far we are away from the goal, and maybe our heuristic is overly optimistic, it thinks that, yeah, we're only two steps away, when in practice, when you consider the walls, it might be more steps. 
So the important thing here is that the heuristic isn't a guarantee of how many steps it's goint to take, it is an estimating, it's an attempt at trying to approximate

So let's make use of Greedy best-first search (GBFS)
In the first 5 steps there's no choice, just go ahead and explore these five states, but now we have a decision point
![[Pasted image 20250604103850.png]]
Now we have a choice between going left and going right, and before when DFS and BFS would just pick arbitrarily because it just depends on the order you throw these two nodes into the frontier and we didn't specify what order you put them into the frontier, only the order you take them out.
Here we can look at 13 and 11 and say, all right, this square is a distance of 11 away from the goal according to our heuristic, according to our estimate, and this one we estimate to be 13 away from the goal, so between those two options, i'd rather have the 11.
We're able to make an informed decision because we know a little something more about this problem, so then we keep following, 10, 9 and so forth until reaching to another decision point and make the same, compare nodes and choice the closest node to the goal
![[Pasted image 20250604105454.png]]
	And we end up doing better, in terms of the number of states we needed to explore, than BFS needed to, BFS explored all right section and all of that other bottom section, but we were able to eliminate that by taking advantage of this heuristic, this knowledge about how close we are to the goal or some estimate of that idea, so this seems so much better, so wouldn't wee always prefer an algorithm like this over an algorithm like breadth-first search? maybe.
	One thing to take into consideration is that we need to come up with a good heuristic. How good the heuristic is, is going to affect how good this algorithm is, and coming up with a good heuristic can oftentimes be challenging.
	But the other thing to consider is to ask the question, just as we did with the prior two algorithms, is this algorithm optimal? to solve this problem. Will it always find the shortest path from the initial state to the goal? And to answer that question, let's take a look at this example for a moment
	![[Pasted image 20250604110553.png]]
	