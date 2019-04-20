% Plot Statistics
%
function plotstat(best_fits, mean_fits, numg)
  t = 1:numg;
  figure;
  plot(t, best_fits, '-b', 'linewidth', 2, ...
       t, mean_fits, '-r', 'linewidth', 2);
  g = get(gcf, 'currentaxes');
  set(g, "fontsize", 15, "linewidth", 2);
  h = legend('Best fitness', 'Mean fitness', 'location', 'southeast');
  set(h, 'fontsize', 15); 
  #grid minor;
  title('GA Convergence by Generation');
  xlabel('Number of generations');
  ylabel('Fitness');
end
