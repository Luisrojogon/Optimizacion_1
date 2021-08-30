#Conjuntos:
set T := {0 .. 12} ordered;

#Par�metros:
param dda{T}; #Demanda periodo t [unidades]
param cap{T}; #Capacidad periodo t [unidades]
param c{T};	#Costo producci�n [$/unidades]
param s{T}; #Costo de inventario [$/unidades]
param f{T}; #Costo fijo producci�n [$/unidades]

#Variables:
var x{T} >=0; #Cantidad a fabricar
var I{T} >=0; #Inventario al final de t
var y{T} binary; #Binaria si produce o no

#Funci�n Objetivo:
minimize costos:
	sum{t in T}(x[t]*c[t]+s[t]*I[t]+y[t]*I[t]);

#Restricciones:

#capacidad de produccion
subject to setup{t in T: ord(t) > 1}:
	x[t] <= cap[t]*y[t];

#inventario
subject to inventario{t in T: ord(t) > 1}:
	I[t] = I[prev(t)]+x[t]-dda[t];

# extra
subject to inicial: I[0] = 0;
