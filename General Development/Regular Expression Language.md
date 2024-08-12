#dev #basics #csharp
Snippets

CHARACTER ESCAPES
\\t 		- Matches a tab
\\n 		- Matches a new line

CHARACTER CLASSES
.       - Wildcard: Matches any single character except \n.
\\d      - Matches any decimal digit. (0-9)
\\D      - Matches any character other than a decimal digit. (0-9)
\\w      - Word Character (a-z, A-Z, 0-9, _)
\\W      - Not a Word Character
\\s      - Matches any white-space character. (space, tab, newline)
\\S      - Matches any non-white-space character (space, tab, newline)
[character_group]     - Matches any single character in character_group. By default, the match is case-sensitive.
\[^character_group]    - Negation: Matches any single character that is not in character_group. By default, characters in character_group are case-sensitive.

ANCHORS
^       - The match must start at the beginning of the string or line.
$       - The match must occur at the end of the string or before \n at the end of the line or string.
\A		- The match must occur at the start of the string.
\Z 		- The match must occur at the end of the string or before \n at the end of the string.
\b      - Word Boundary
\B      - Not a Word Boundary

ALTERNATION CONSTRUCTS
|       - Either Or

GROUPING CONSTRUCT
( )     - Group

Quantifiers:
*       - Matches the previous element zero or more times.
+       - Matches the previous element one or more times.
?       - Matches the previous element zero or one time.
{n}     - Matches the previous element exactly n times.
{n,m}   - Matches the previous element at least n times, but no more than m times.


 How to reach specific information

Ex. Search for a phone number with this structure 000-000-0000
![[Pasted image 20240407190320.png]]
To simplify
![[Pasted image 20240407191023.png]]

To reach this specific number pattern 
![[Pasted image 20240408011724.png]]

In this case i want to match with three kind of German phone numbers
![[Pasted image 20240407222352.png]]

![[Pasted image 20240408010819.png]]

Using in C#
![[Pasted image 20240408170411.png]]

![[Pasted image 20240408234025.png]]

##### Why and where use GroupCollection?
In this case is just simple use hit.Value and hit.Index because you are only looking for one number, so if you have a case where you must to search for an optional part and you need to print or view them separately, GroupCollection is a well way to make it

group[0] is the first group that creates when use hit.Groups and shows the fully result and not every part of this

I'm gonna put here an example where you have more of one group and how you can show by separately every part

![[Pasted image 20240408234456.png]]

In this case you have 2 coincident for the same number because the program matches first the integer part with `(\d+)` who is obligatory, and a second part of the same number who is an optional part with `(\.\d+)?` 
So GroupCollection will create two groups more, [0] = where gonna be the whole number [1] = where gonna be the integer part and [2] = where gonna be the decimal part.

So if you just need match, view and show the whole result, or result is just one thing don't use GruoupCollection, directly .Value and .Index properties


