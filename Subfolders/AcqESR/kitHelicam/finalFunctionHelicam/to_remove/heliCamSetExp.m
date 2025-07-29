function heliCamSetExp(ObjCamera,Exposure)
	% Function to set the sensitivity of the camera
	sensitivity = Exposure;
	
	ObjCamera.c4dev.writeFloat("LockInSensitivity",sensitivity);
	ObjCamera.sensitivity = sensitivity
end
