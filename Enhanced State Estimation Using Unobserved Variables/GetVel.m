function z = GetVel()

persistent Velp Posp

if isempty(Posp)
    Posp = 0;
    Velp = 80;
end

dt = 0.1;

v = 0 + 10*randn;

Posp = Posp + Velp*dt;
Velp = 80 + v;

z = Velp;