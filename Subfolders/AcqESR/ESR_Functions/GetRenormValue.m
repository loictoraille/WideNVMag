function RenormValue = GetRenormValue(Spectrum)

% We normalize with the five first values and the last five values

SizeAverage = 5;

RenormValue = mean([mean(Spectrum(1:SizeAverage)) mean(Spectrum(end-SizeAverage:end))]);

end