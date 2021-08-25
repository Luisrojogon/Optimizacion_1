# conjuntos
set I := {1 .. 3}; # mineral
set J := {1 .. 2}; # aleacion
set K := {1 .. 4}; # metal

# parametros
param alpha {i in I, k in K}; # contenido de metal k en mineral i
param d {i in I}; # disponibilidad de mineral i
param c {i in I}; # precio compra mineral i
param p {j in J}; # precio venta aleacion j
param l {j in J, k in K}; # cantidad minima de metal k en aleacion j
param u {j in J, k in K}; # cantidad maxima de metal k en aleacion j

# variables
var x {i in I, j in J} >= 0;

# funcion objetivo
maximize utilidad: sum{i in I, j in J} x[i,j]*(p[j]-c[i]);

# restricciones

# disponibilidad
subject to disp {i in I}:
		sum{j in J} x[i,j] <= d[i];

# recursos disponibles
subject to min_cont {j in J, k in K}:
	sum{i in I} x[i,j]*alpha[i,k] >= l[j,k]*(sum{i in I} x[i,j]);

subject to max_cont {j in J, k in K}:
	sum{i in I} x[i,j]*alpha[i,k] <= u[j,k]*(sum{i in I} x[i,j]);
