function [val,direction] = sweepAxis( NI_card,X,Y,Z,L,laser_state,axis,step, direction,OtherAxisVal)

switch upper(axis)

    case 'X'

        X = X + direction*step;

        if X >= 10
            X = 10;
            direction = -1;

        elseif X <= -10
            X = -10;
            direction = 1;

        end

        Xv = X;
        Yv = OtherAxisVal;

        val = X;

    case 'Y'

        Y = Y + direction*step;

        if Y >= 10
            Y = 10;
            direction = -1;

        elseif Y <= -10
            Y = -10;
            direction = 1;

        end

        Xv = OtherAxisVal;
        Yv = Y;

        val = Y;

end

write(NI_card,[Xv, Yv, Z, L, laser_state]);

pause(0.05);

end