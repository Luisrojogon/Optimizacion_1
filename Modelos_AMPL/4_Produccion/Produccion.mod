# conjuntos
set I := {1 .. 3}; # producto
set J := {1 .. 3}; # parcelas

# parametros
param t {j in J} >= 0; # tierra cultivable
param a {j in J} >= 0; # agua disponible
param ca {i in I} >= 0; # consumo agua
param c {i in I} >= 0; # cuota maxima de cultivo
param u {i in I} >= 0; # ganancia neta de cada producto

# variables
var x {i in I, j in J} >= 0; # cantidad de cultivo en cada parcela

# modelo matematico

# funcion objetivo
maximize z:
	sum{i in I, j in J} x[i,j]*u[i];

# restricciones

# tierra cultivable
subject to tierra {j in J}:
	sum{i in I} x[i,j] <= t[j];

# maxima cantidad de cultivo
subject to cuota {i in I}:
	sum{j in J} x[i,j] <= c[i];

subject to agua {j in J}:
	sum{i in I} x[i,j]*ca[i] <= a[j];
