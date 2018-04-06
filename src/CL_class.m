function  [b] = CL_class(Vg, rho, Nx)
b = zeros(1,Nx);
b = -rho;
b(1) = Vg;  %On met Vg en 0
b(Nx) = 0;  %on met 0 en 1
end
