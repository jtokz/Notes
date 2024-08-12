-- How to call information:

-- * means all, so select * from Animal = give me everything about Animal Table
-- select * from Animal

select a.Name from Animal a inner join ZooAnimal za on a.Id = za.AnimalId where za.ZooId = 1
-- let's talk about this line of code:

-- *** select a.Name from Animal a ***
-- with `select` you say ok this is the element that i want to take `from` this list
-- `a` is a variable that we are going to use in order to access to the columns of Animal's table, similar to a foreach
-- so we are going to select the element inside of `Name` column through the variable `a`
-- it's important to put a at finish to from Animal a
-- this way the computer knows which table the variable is being assigned to.

-- *** inner join ZooAnimal za ***
-- `inner join` specifies the internal connection between the Animal table with the ZooAnimal table
-- which a variable is also assigned, this time called `za`

-- *** on a.Id = za.AnimalId ***
-- this is the condition that must be matched, so you say
-- show me the a.Name corresponding to a.Id when a.Id = za.AnimalId
-- so, when, for example a.Id = 1 && za.AnimalId = 1 the a.Name corresponding to a.Id will be showed

-- why of this? Because when ZooAnimal table was created, was put in the AnimalId Column the corresponding id of each animal
-- according to the Id's column of the Animal table

-- *** where za.ZooId = 1
-- in addition of the previous requeriment we add one more, when would a.Id = za.AnimalId, 
-- the za.ZooId of that za.AnimalId would be = 1, so, only the elements that had za.ZooId = 1 will appear 
