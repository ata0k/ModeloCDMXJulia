"RK4v(a,b,N,α,f) obtiene, mediante el metodo Runge-Kuta de orden 4 la solucion numerica 
de la ecuacion diferencial dx/dt = f(x,t) desde el punto t=a, hasta 
el punto t=b, con condicion inicial x(a)=α. Se obtienen N puntos de la solucion"
function RK4v(a,b,N,α,f::Function...)
    F = collect(f)
    n = length(α)
    println(n)
    m = length(F)
    if m !=n
        return "el numero de variables α debe ser igual al numero de funciones f"
    end
    X = Float64[]
    T = Float64[]
    h = (b-a)/N
    t = a
    w = α
   
    push!(T,t)
    append!(X,w)
    K1 = zeros(n)
    K2 = zeros(n)
    K3 = zeros(n)
    K4 = zeros(n)
    for i in 1:N 
        for j in 1:n
            K1[j] = h*F[j](w,t)
        end
        for j in 1:n
            K2[j] = h*F[j](w+K1/2,t+h/2)
        end
        for j in 1:n
            K3[j] = h*F[j](w+K2/2,t+h/2)
        end
        for j in 1:n
            K4[j] = h*F[j](w+K3,t+h)
        end
        w = w+(K1+2*K2+2*K3+K4)/6
        t = i*h+a
        append!(X,w)
        push!(T,t)
    end
    return T,reshape(X,n,N+1)' 
end    

" ModelosCDMX(ti, tf, N, Condiciones_iniciales, Ro, Dinfect, Dincub, pgrave, DRL,DRH, Dhosp, picu, DRICU, DM, pm), regresa un 
vector de tiempo (con los tiempos desde ti, hasta tf), con N entradas y una matriz Y, donde cada columna es un vector con  
las soluciones de S (suceptibles), E (expuestos), I (infectados), L (leves), G (graves), H (hospitalizados), ICU (cuidados
intensivos), R (recuperados) y M (muertos)"
function ModelosCDMX(ti, tf, N, Condiciones_iniciales, Ro, Dinfect, Dincub, pgrave, DRL,DRH, Dhosp, picu, DRICU, DM, pm)
    f1(x, t) = -Ro/Dinfect * x[1]*x[3]
    f2(x, t) = Ro/Dinfect * x[1]*x[3]- 1/Dincub *x[2]
    f3(x, t) = 1/Dincub *x[2] - 1/Dinfect*x[3]
    f4(x, t) = (1-pgrave)*1/Dinfect*x[3]-(1/DRL)*x[4]
    f5(x, t) = pgrave/Dinfect *x[3]- 1/Dhosp*x[5]
    f6(x, t) = 1/Dhosp*x[5]-((1-picu)/DRH+picu/DICU)*x[6]
    f7(x, t) = picu/DICU*x[6]-((1-pm)/DRICU+pm/DM)*x[7]
    f8(x, t) = 1/DRL*x[4]+(1-picu)/DRH*x[6]+(1-pm)/DRICU * x[7]
    f9(x, t) = pm/DM * x[7]
    T, Y = RK4v(0,350,100,[1.0-2/22000000, 1/22000000,1/22000000,0,0,0,0,0,0],f1, f2, f3, f4, f5, f6, f7, f8, f9)
    return T, Y
end
