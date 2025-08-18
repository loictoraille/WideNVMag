function y = Model_coated_fluorescence(f,B,D,E,delta_nu)

 % parametre_model;
 gamma = 2.8;
 fplus  = @(theta) 1./(1+( (f-D + sqrt(E^2 + (gamma * B*cos(theta)).^2 ))/delta_nu  ).^2);
 fminus = @(theta) 1./(1+(  (f-D - sqrt(E^2 + (gamma * B*cos(theta)).^2 ))/delta_nu  ).^2);

 f_tot = @(theta) sin(theta)*(fplus(theta) + fminus(theta));

 y = integral(f_tot,0,pi/2,'ArrayValued',true);
 y = y/sum(y);

 end
