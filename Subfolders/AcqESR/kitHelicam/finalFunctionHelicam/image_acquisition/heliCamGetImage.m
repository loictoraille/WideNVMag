function ImageMatrix = heliCamGetImage(ObjCamera)
		% function that return the 2D Root Mean Square image of the demodulated
		% signal
		[I,Q] = heliCamGetRaw3DIQimage(ObjCamera);	
		ImageMatrix = squeeze(sqrt(mean(I.^2 + Q.^2)));

end
