function name = GenDateTimeName(RepeatScan)
    
    name = [datestr(now, 'yyyymmdd-HHMMSS') '-ESR-WideField'];
    
    if RepeatScan > 1
        name = [name '-MultiScan'];
    end

end