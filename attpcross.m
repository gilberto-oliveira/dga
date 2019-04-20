% Arithmetic crossover
%
function [_e1, _e2] = attpcross(e1, e2, lw, up, gamma=.4)
  alpha = unifrnd(-gamma, 1 + gamma, size(e1));
  _e1 = alpha .* e1 + (1 - alpha) .* e2;
  _e2 = alpha .* e2 + (1 - alpha) .* e1;
  _e1 = max(_e1, lw);
  _e1 = min(_e1, up);
  _e2 = max(_e2, lw);
  _e2 = min(_e2, up);
end