function [V_new] = V_dot(R,V)

m=1.5;
zeta=0.7;
k=300;

V_new = -(zeta/m)*V-(k/m)*R;
end