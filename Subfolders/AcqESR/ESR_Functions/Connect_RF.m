function smb = Connect_RF()
global TestWithoutHardware RF_Address

if ~TestWithoutHardware
    
    try
        smb = VISA_Instrument(RF_Address);
        smb.Write('FREQ:MODE CW');%RF mode = continuous
    catch
        disp('Unable to connect to RF generator');
    end    
    
else    
    smb = NaN;
end

end

%% Probl�mes rencontr�s
%%- Enlever parefeu
%%- Mettre Generateur en adresse statique avec une adresse IP (129.175.56.95) et un masque
%%de sous reseau de type 255.255.255.0.
%%Dans les param�tres du reseau sur l'ordi, dans les param�tres IPv4 :
%%adresse IP, choisir une adresse ip de type '129.175.56.XX', qui a les 3
%%m�me premiers chiffres que le g�n�rateur pour �tre dans le m�me segment
%%de r�seau'. Masque : 255.255.255.0, passerelle =ip du g�n�rateur, serveur
%%DNS pr�f�r� = ip du g�n�rateur, serveur DNS auxiliaire = ne rien mettre.

