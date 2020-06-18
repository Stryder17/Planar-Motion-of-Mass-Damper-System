clc
clear

start=0;
dt=0.01;
stop=15;
time= start:dt:stop;

position = zeros(2,length(time));
velocity = zeros(2,length(time));

%initial condition
position(:,1)=[1; 2];
velocity(:,1)=[-10; 5];
R=position(:,1);
V=velocity(:,1);

%RK-4
for i=1:length(time)-1
    k1=dt*R_dot(V);
    l1=dt*V_dot(R,V);
    k2=dt*R_dot(V+l1/2);
    l2=dt*V_dot(R+k1/2,V+l1/2);
    k3=dt*R_dot(V+l2/2);
    l3=dt*V_dot(R+k2/2,V+l2/2);
    k4=dt*R_dot(V+l3);
    l4=dt*V_dot(R+k3,V+l3);
    
    k=(k1+2*k2+2*k3+k4)/6;
    l=(l1+2*l2+2*l3+l4)/6;
    
    R=R+k;
    V=V+l;
    position(:,i+1)=R;
    velocity(:,i+1)=V;
    
end

%plot
figure
x = position(1,:);
y = position(2,:);
plot(x,y);

hold on

%velocity vectors
vx=velocity(1,:);
vy=velocity(2,:);

quiver(x,y,vx,vy)


