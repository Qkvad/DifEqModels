function rj=term_obrada_funkcija(t,T)
  l=1;                % rod length
  fi=0.01;            % rod diameter
  Ap=l*2*pi*(fi/2);   % area of the rods cape
  ro=7822;            % steel density
  c=444;              % specific heat capacity
  e=0.7;              % relative power of heat radiation
                      % heat transfer coefficients
  H1=15;              % free convection
  H2=100;             % forced convection
  T0=21+273.15;       % temperature of surrounding air
  th=70;              % time of stoping heating and tunring on venting
  Qe=3000;            % heat power
  sigma=5.67e-8;      % Stefan-Boltzmann constant
  V=pi*l*(fi/2)^2;    % rod volume to calculate mass
  m=ro*V;             % mass of the rod
  if t<th
    H=H1;
  else
    H=H2;
  end
  rj=(1/(m*c))*(Qe-Ap*(H*(T-T0)+e*sigma*(T^4 - T0^4)));
end