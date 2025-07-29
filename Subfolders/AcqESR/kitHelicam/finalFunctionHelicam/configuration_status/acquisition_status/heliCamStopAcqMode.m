function heliCamStopAcqMode(ObjCamera)
	% function to change camera mode from acquisition mode

	ObjCamera.c4dev.stopAcquisition();
	ObjCamera.AcqMode = false;
end
