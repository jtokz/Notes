#csharp #basics #ide 

We are going to see how you can debugging in Visual studio 2022 (IDE)

Breakpoints: They are red points that you put in different lines to mark when you want that the running code breaks. so by this way you can watch step by step how the code is executing
###### Autos #auto

Son una propiedad del debugging que se encarga de mostrarnos automáticamente las variables que están al rededor del breakpoint, las que están cerca de donde está la ejecución del código actualmente

// Is a propriety of debugging that is responsible to show us automatically the variables that are surround to the breakpoint, those that are close to where the code execution is currently

You can open from visual studio bar, Debug>Windows>Autos, so from this window you can watch the closest variables to where the execution currently is and you can modify the values of the variables to test the code

###### Watch 1,2,3,4 #watch
 
You can open a Watch window and add items to watch

![[Untitled 124.png]]

Here you can have the variables you want to keep in mind, currentFriend doesn’t exist but it will exist, later in the code

![[Untitled 125.png]]

You only can Watch variables in the currently context, in this case the variable at the top of the code, in the Main method “friends” cannot be watched because we are in the context of the method GetPartyFriends, so the variable partyFriends is the variable inside of the method, but isn’t the variable partyFriends in the Main method

![[Untitled 126.png]] 
That means this variables are not available here, because how i say again, we are currently in GetPartyFriends method.
So this partyFriends is not the partyFriends that we are looking in Watch 1

###### Locals
Locals shows you the variables that are available in the local context, so in the scope that we’re currently looking at, the scope is the method we are
Hay un gran problema con nuestro siguiente ejercicio que debemos resolver

![[Untitled 127.png]]

![[Untitled 128.png]]

![[Untitled 129.png]]

Cuando estamos pasando nuestro parámetro list, al método GetPartyFriends, estamos pasando la lista que hemos indicado en el Main method, en este caso sería friends, pero hay un problema y es que estamos pasando los datos de list (friends) como referencia y no como valor, eso quiere decir que todos los cambios que podamos hacer a list dentro del método se harán a la lista original fuera de él, en este caso estamos usando un Remove, para sacar de la lista a todas las personas que serán invitadas y la lista original disminuiría su tamaño, esto es un problema ya que si más adelante requerimos usarla en otro método puede que esté vacía, porque si tiene por ej. 7 personas y requerimos invitar 7, la lista quedará null, y por lo tanto no se podrá trabajar con ella, aún si no queda completamente vacía no sería fiable pues no se contaría con la totalidad de datos o personas que se pusieron inicialmente en ella

Esto lo podemos solucionar haciendo una copia de la lista original y almacenarla en una variable para poder trabajar con ella sin que se vea afectado el listado original

![[Untitled 130.png]]

###### Throw errors. #throw

Es mejor capturar los errores lo antes posible, de lo contrario permitirán que se ejecute mucho código y podría poner en riesgo otros métodos, así que lo mejor es poder verlo lo antes posible, en nuestro ejercicio anterior el error se ejecutaba desde la línea 42, pero con un Throw y poniendo la excepción pudimos captarlo y detener su ejecución desde mucho antes y poder de esta manera controlarlo mejor

![[Untitled 131.png]]

Esta es una herramienta para tener controlado un error y ver futuros posibles errores de este mismo tipo, por ejemplo puede ser que el número de invitados sea mayor a la lista, que la lista esté vacía, que sea negativa, y en cada caso el programa debe enviarnos a nuestro Throw para ver que no hay posibilidad alguna de vulnerarlo de algún otro tipo en el mismo error
Hicimos esto también para que nuestro programa no hiciera cambios en nuestro database, pues podría ser trágico que haga modificaciones y luego no se puedan revertir

###### CALL STACK #callstack
With the call stack we can see from where we were called, from where we were called again and so forth, so we can go up all the way to the level at which we what the initial method was called, and watch the initial method, then the next method called inside it, and then finally the variable what is created based on a list that is empty (the error)