# Test OriginATM

### Repositorio de test para Origin Software


#### Algunas Notas Generales

- Para el ocultamiendo de datos decidi utilizar Bcrypt, esto tanto para el almacenado de
las tarjetas como para las claves de las mismas.

- A nivel de aplicacion se trato de imitar el encubrimiento de la data por lo que se
que no es optimo el loop for e ir comprobando que hash pertenece a la tarjeta (desconozco
como trabajan esto las entidades bancarias).

- Si bien hay cammpos claves que se muestran como bigint lo considere pensando en volumen de 
registros.


#### Data de prueba

Para el caso de prueba se tiene lo siguiente:

**Numero de tarjeta:** 1111111111111111

**Pin o clave:** 33333


#### Plataforma

- SqlServer
- Asp.Net Core 3.1
