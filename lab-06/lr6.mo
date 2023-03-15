model lr6

parameter Real a=0.07;
parameter Real b=0.03;

Real S(start=15370);
Real I(start=115);
Real R(start=15);

equation
  der(S) = 0;
  der(I) = b*I;
  der(R) = -b*I;

end lr6;


model lr6

parameter Real a=0.07;
parameter Real b=0.03;

Real S(start=15370);
Real I(start=115);
Real R(start=15);

equation
  der(S) = -a*S;
  der(I) = a*S-b*I;
  der(R) = b*I;

end lr6;
