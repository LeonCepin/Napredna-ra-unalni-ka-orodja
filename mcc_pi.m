function [kvad,krog] = mcc_pi(st_tock)
    kvad=[];
    krog=[];
    polmer = 1;
    for i = 1:st_tock
        x = 2 * rand() - 1;
        y = 2 * rand() - 1;
        kvad=[kvad;[x,y]];
        if x^2 + y^2 <= polmer^2
            krog= [krog; [x,y]];
        end
end