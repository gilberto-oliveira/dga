% Plot the problem
%
function [] = plotenv(f, x, y, z, lw, up, step, gid)
  X = lw:step:up;
  Y = lw:step:up;
  [X, Y] = meshgrid(X, Y);
  Zt = [X(:) Y(:)];
  Z = f(Zt');
  Z = reshape(Z, sqrt(length(Zt)), sqrt(length(Zt)));
  contour(X, Y, Z, 6, 'linewidth', 1, 'linecolor', 'k');
  g = get(gcf, "currentaxes");
  set(g, "fontsize", 15, "linewidth", 2);
  hold on;
  plot(x, y, 'ks', 'markersize', 6, 'markerfacecolor', 'm', 'markeredgecolor', 'k');
  title(sprintf('Population after %02d generations', gid));
  xlabel('X');
  ylabel('Y');
  zlabel('Fitness');
  legend('Problem', 'Individual', 'location', 'southeast');
  hold off;
  refresh;
end