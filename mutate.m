% Mutate
%
function [_e] = mutate(e, lw, up, mut_rate=1)
  n = numel(e);
  mutn = ceil(mut_rate * n);
  j = randperm(n, mutn);
  sigma = .1 * (up - lw);
  _e = e;
  _e(j) = e(j) + sigma * randn(size(j));
  _e = max(_e, lw);
  _e = min(_e, up);
end