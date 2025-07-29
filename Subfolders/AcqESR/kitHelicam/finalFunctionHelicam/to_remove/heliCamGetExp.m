function [exp,expUnit] = heliCamGetExp(ObjCamera)
% Supposed to return the exposure of the camera but will actually return the "sensitivity" 	
	sensitivity = ObjCamera.c4dev.readFloat("LockInSensitivity");


	exp = sensitivity;
	expUnit = "%"; % sensitivity is a ratio
end
