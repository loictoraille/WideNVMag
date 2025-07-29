function heliCamShutdown(ObjCamera)
	% function disconnected the camera from the computer
	% not calling this function may result in matlab crash
	% or camera crashes

	% TODO: check the acquisition mode before doing this, or the programme might crash
	ObjCamera.c4dev.stopAcquisition();
	ObjCamera.c4dev.release();
	ObjCamera.c4if.release();

end
