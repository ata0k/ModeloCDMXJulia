# Modelo CDMX

Este repositorio está basado en el sistema de ecuaciones diferenciales del [Modelo covid-19 CDMX](https://modelo.covid19.cdmx.gob.mx/modelo-epidemico)

Incluye un código para realizaar Runge-Kuta 4 y el sistema de ecuaciones, así como un ejemplo para correr el modelo. 

Para usarlo hay que bajar el archivo "ModeloCovid-19CDMX.jl", después en una terminal de Julia (o notebook) escribir Include("ModeloCovid-19CDMX.jl") o la dirección donde hayan descargado el archivo. 

Como ejemplo pueden copiar y usar las siguientes lineas: 

**using Plots # No es necesario tener esta paquetería, pueden usar la paquetería de gráficos de su preferencia. **\
**Ro = 2.83 **\
**Dinfect = 2.9 **\
**Dincub = 5.2 **\
**pgrave = 0.15 **\
**DRL = 11.1 **\
**Dhosp = 15 **\
**DRH = 15 **\
**picu = 0.05 **\
**DRICU = 5 **\
**DICU = 5 **\
**DM = 32 **\
**pm = 0.035 **\
**ti = 1 **\
**tf = 100 **\
**N = 100 **\
**Poblacion_suceptible = 22e **\
**Condiciones_iniciales = [1-2/22000000, 1/22000000, 1/22000000, 0,0,0,0,0,0] **\
**T, Y = ModelosCDMX(ti, tf, N, Condiciones_iniciales, Ro, Dinfect, Dincub, pgrave, DRL,DRH, Dhosp, picu, DRICU, DM, pm) **\
**plot(xlabel = "dias", ylabel = "poblacion") **\
**plot!(T, Y[:, 1]* Poblacion_suceptible, label = "Susceptibles") **\
**plot!(T, Y[:, 3]* Poblacion_suceptible, label = "Infectados") **\
**plot!(T, Y[:, 6]* Poblacion_suceptible, label = "Hospitalizados") **\
**plot!(T, Y[:, 8]* Poblacion_suceptible, label = "Recuperados") **\
**plot!(T, Y[:, 9]* Poblacion_suceptible, label = "Muertes") **\

