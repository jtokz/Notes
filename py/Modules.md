---
tags: [lang/python, area/basics, type/reference]
---

###### How to import modules
just at the top of file use
import [module] or from [module] import [functionality]

Create a module
TODO : In a future add info about how create and export modules for the general use of other users

```python
# my_module.py
my_favorite_number = 7
```

```python
# task.py
import random
import my_module

print(my_module.my_favorite_number)
```


### Random module
Randomization is really important when we want to create computer programs that have a degree of unpredictability, the biggest category of that is of course, games
How can a computer that are deterministics, create some random numbers? There's a whole bunch of maths that can be applied to create what are called Pseudo random number generators, and the one that python uses is something called The Mersenne Twister

Some libraries that we can use to gen random numbers
```python
import random
import os
import secrets

random.seed(42)
print(random.getrandbits(32))

print(str(os.urandom(8)))

print(secrets.randbits(32))
```
It's important to keep in mind that these generated numers (RANDOM MODULE) are not truly random numbers, instead they are "pseudo random numbers" because they depend of a seed, and are not made for criptography, for example, for this use you can made use of os.urandom and Secrets module, that collect system data like system time in nanoseconds, a process pid and some other data to generate true random numbers