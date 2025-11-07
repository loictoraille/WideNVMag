function [Tension4, laser_value] = LaserOff(panel)
% optionally return Tension4, the fourth tension value of the NI card, for ease of use in PerformAlignPiezo sequence
% same for laser_value, state of the laser shutter

h=findobj('tag','shutterlaser');

h.Value = 0;
h.ForegroundColor = [0,0,0];

[Tension4, laser_value] = Smart_PZ_Light_Laser_Write(panel);

end