###### How to import modules
just at the top of file use
import [module] or from [module] import [functionality]

Create a module
TODO : In a future add info about how create and export modules for the general use of other users

![[Pasted image 20250319110955.png]]
![[Pasted image 20250319111003.png]]


### Random module
Randomization is really important when we want to create computer programs that have a degree of unpredictability, the biggest category of that is of course, games
How can a computer that are deterministics, create some random numbers? There's a whole bunch of maths that can be applied to create what are called Pseudo random number generators, and the one that python uses is something called The Mersenne Twister

Some libraries that we can use to gen random numbers
![[Pasted image 20250319093121.png]]
It's important to keep in mind that these generated numers (RANDOM MODULE) are not truly random numbers, instead they are "pseudo random numbers" because they depend of a seed, and are not made for criptography, for example, for this use you can made use of os.urandom and Secrets module, that collect system data like system time in nanoseconds, a process pid and some other data to generate true random numbers