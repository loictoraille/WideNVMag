function B = fastMagneticFieldfit(SPX,SPY,D,bstart)
  parametre_model;

  % normalization of the spectrum
  spectre = max(SPY) - SPY;
  spectre = spectre/sum(spectre);

  fcost = @(b) Model_coated_fluorescence(SPX,b,D,E,delta_nu) - spectre;
  B = lsqnonlin(fcost,bstart,0,10); % temporary value

end
