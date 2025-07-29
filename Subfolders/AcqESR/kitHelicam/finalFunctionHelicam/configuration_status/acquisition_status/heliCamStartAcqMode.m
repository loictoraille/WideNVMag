function heliCamStartAcqMode(ObjCamera)
	% function to change camera mode from configuration mode
	% to the acquisition mode

	% This function parameter is a mystery, 4 worked so far
	ObjCamera.c4dev.startAcquisition(4); % TODO: find why is this parameter important
	
	ObjCamera.AcqMode = true;

end
