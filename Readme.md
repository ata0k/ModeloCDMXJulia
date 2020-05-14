# Modelo CDMX

Este repositorio está basado en el sistema de ecuaciones diferenciales del [Modelo covid-19 CDMX](https://modelo.covid19.cdmx.gob.mx/modelo-epidemico)

Incluye un código para realizaar Runge-Kuta 4 y el sistema de ecuaciones, así como un ejemplo para correr el modelo. 

Para usarlo hay que bajar el archivo "ModeloCovid-19CDMX.jl", después en una terminal de Julia (o notebook) escribir Include("ModeloCovid-19CDMX.jl") o la dirección donde hayan descargado el archivo. 

**Ro** puede ser un valor fijo o un vector con el mismo tamaño que el número de pasos (días) de simulación. Si es un vector, en cada paso de la simulación se actualiza el valor de Ro. 

Como ejemplo pueden copiar y usar las siguientes lineas que corresponden a los parámetros de la página el 14/05/2020: 

**using Plots** # No es necesario tener esta paquetería, pueden usar la paquetería de gráficos de su preferencia. 
**dias = 200**\
**Ro = 2.83*ones(dias)**\
**for i in 38:dias**\
    **Ro[i]= 2.83**\
**end**\
**Dinfect = 2.9** \
**Dincub = 5.2** \
**pgrave = 0.13** \
**DRL = 14** \
**Dhosp = 4** \
**DRH = 12** \
**picu = 0.05** \
**DRICU = 7** \
**DICU = 1** \
**DM = 8** \
**pm = 0.03** \
**ti = 0** \
**tf = dias** \
**N = dias** \
**Poblacion_suceptible = 22e6** \
**Condiciones_iniciales = [1-1/22000000, 1/22000000, 0, 0,0,0,0,0,0]** \
**T, Y = ModelosCDMX(ti, tf, N, Condiciones_iniciales, Ro, Dinfect, Dincub, pgrave, DRL,DRH, Dhosp, picu, DRICU, DM, pm)** \
**plot(xlabel = "dias", ylabel = "poblacion")** \
**plot!(T, Y[:, 1]** * **Poblacion_suceptible, label = "Susceptibles")** \
**plot!(T, Y[:, 3]** * **Poblacion_suceptible, label = "Infectados")** \
**plot!(T, Y[:, 6]** * **Poblacion_suceptible, label = "Hospitalizados")** \
**plot!(T, Y[:, 4] * Poblacion_suceptible, label = "Leves")**\
**plot!(T, Y[:, 5] * Poblacion_suceptible, label = "Graves")**\
**plot!(T, Y[:, 8]** * **Poblacion_suceptible, label = "Recuperados")** \
**plot!(T, Y[:, 9]** * **Poblacion_suceptible, label = "Muertes",ylim = (1,1e6), key = :topleft)** 

![alt text](https://github.com/ata0k/ModeloCDMXJulia/blob/master/test2.png " Imagen prueba")

