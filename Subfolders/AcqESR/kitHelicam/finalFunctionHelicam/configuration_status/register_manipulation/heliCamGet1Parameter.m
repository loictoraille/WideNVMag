function value = heliCamSet1Parameter(ObjCamera,registerName)
  % Function wrote to read the helicam register separatly (for debug and simplicity)

  heliCamRegisterType; %charge the dictionary of register type


  regType = registerType(registerName);
  
  if strcomp(regType,"Enumeration")
  	value = ObjCamera.c4dev.readString(registerName);

  elseif strcomp(regType,"Float")
  	value = ObjCamera.c4dev.readFloat(registerName);

  elseif strcomp(regType,"Integer")
  	value = ObjCamera.c4dev.readInteger(registerName);
 
  elseif strcomp(regType,"Boolean")
  	disp('must be checked on the library first');
  	value = ObjCamera.c4dev.readInteger(registerName);
  end
	
end
