# conjuntos
set I := {1 .. 2}; # productos
set J := {1 .. 2}; # material

# parametros
param precio {i in I}; # precio unitario
param disp_material {j in J}; # disponibilidad del disp_material
param req_material {i in I, j in J}; # requerimiento
param dda_max {i in I};

# variables
var x {i in I} >= 0;

# funcion objetivo
maximize ingreso: sum{i in I} precio[i]*x[i];

# restricciones

# recursos disponibles
subject to recursos {j in J}:
	sum{i in I} req_material[i,j]*x[i] <= disp_material[j];

# demanda maxima
subject to demanda {i in I}:
	x[i] <= dda_max[i];
