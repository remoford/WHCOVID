function y_final = evolve(params, showplot)

set(0,'DefaultFigureWindowStyle','docked');

t_min = 0;
t_max = 10;

y0 = initial_conditions();
tspan=[t_min, t_max];

[t,y]=ode15s(@(t, y)odefun(t, y, params), tspan, y0);

if showplot == 1
    figure;

    hold on;
    for species_idx=1:11
        plot(t, y(:, species_idx))
    end

    legend('A2', 'A1', 'I', 'As', 'F', 'X', 'Ms', 'M', 'V', 'S')

    drawnow;

end

y_final = y(end, :);