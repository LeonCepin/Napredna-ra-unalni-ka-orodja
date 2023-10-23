st_tock = 10000;

clf;

[nas_nap,nas_pi,nas_krog,nas_kvad]=area_pi(st_tock);

risanje(nas_krog,nas_kvad);


function [napaka, pi_i,m_krog,m_kvad] = area_pi(st)
    
    [kv,kr] = mcc_pi(st);
    
    m_krog=kr;
    m_kvad=kv;

    [x1,y1] = size(kv);
    [x2,y2] = size(kr);

    pi_i = 4 * x2 / x1;

    napaka = abs(pi_i-pi);

    disp(['Naš izračunan pi: ', num2str(pi_i)]);
    disp(['Napaka našega pi od pravega pi: ', num2str(napaka)]);

    %definicija: z metodo monte carlo izračunamo vrednost pi, pri čemer
    %izračunamo štirikratnik razmerja točk znotraj in zunaj kroga. Napako
    %izračunamo z razliko našega pi in matlab pi.
end

function [] = risanje(m_krog,m_kvad)

    kroznica = @(fi) [cos(fi); sin(fi)];
    kot = linspace(0, 2*pi, 100);
    koordinate = kroznica(kot);
    plot(koordinate(1, :), koordinate(2, :),"b");
    hold on;

    razlika = setdiff(m_kvad,m_krog,"rows");

    plot(m_krog(:, 1), m_krog(:, 2), 'ro',"MarkerSize",1);
    hold on;
    plot(razlika(:, 1), razlika(:, 2), 'go',"MarkerSize",1);
    axis equal;

end
