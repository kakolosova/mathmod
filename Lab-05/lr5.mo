model lr5
Real x(start=14);
Real y(start=9);

parameter Real a = 0.21;
parameter Real b = 0.049;
parameter Real c = 0.41;
parameter Real d = 0.037;

equation
  der(x) = -a*x + b*x*y;
  der(y) = c*y - d*x*y;
  
end lr5;
