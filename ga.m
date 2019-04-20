close all;
clear all;
clc;

# compute start time
st = time();

% evaluation function
f = @(X) f6(X);

% GA global paramenters
posz = 200; gesz = 2;
mutp = .2;  crossp = .75;
lw = -100;  up = 100;
# number of generations and gap (elitism)
numg = 1000; ngap = 20;
# test parameters
npsz = 10;   nrsz = 10;

# output parameters
z = zeros(1, posz);

mean_fits = zeros(1, numg); 
best_fits = zeros(1, numg);
best_fits_run = zeros(nrsz, numg);
mean_fits_run = zeros(nrsz, numg);
best_fits_pop = zeros(npsz, numg);
mean_fits_pop = zeros(npsz, numg);

# Populations loop
for pid = 1:npsz
  % Creating an initial population
  P = unifrnd(lw, up, [posz gesz]);
  P_tmp = P;
  # Executions loop
  for rid = 1:nrsz
    # GA main loop
    for gid = 1:numg
      # calculate fitness
      z = fitness(f, P);
      # plot visual result (3D environment)
      # plotenv(f, P(:, 1), P(:, 2), z, lw / 10, up / 10, .1, gid);
      # collect statistics
      best_fits(gid) = max(z); 
      mean_fits(gid) = mean(z);
      # print statistics
      printf('Population %02d. Run %02d\n', pid, rid);
      printf('Generation %02d, mean fitness: %f\n', gid, mean_fits(gid));
      printf('Best fitness: %f\n\n', best_fits(gid));
      fflush(stdout);
      # new population
      newp = zeros(posz, gesz);
      cnt = 0;
      # elitism
      if (ngap > 0)
        pgap = elitism(ngap, P, z);
        [cnt, ~] = size(pgap);
        newp(1:cnt, :) = pgap(1:cnt, :);
      end
      # Generation loop
      while (cnt < posz)
        # selection
        e1 = P(roulette(z), :);
        e2 = P(roulette(z), :);
        #e1 = P(tournament(z), :);
        #e2 = P(tournament(z), :);
        # crossover
        if (rand <= crossp)
          [e1, e2] = attpcross(e1, e2, lw, up);
          #[e1, e2] = twopcross(e1, e2);
          #[e1, e2] = unipcross(e1, e2);
        end
        # mutation
        if (rand <= mutp)
          e1 = mutate(e1, lw, up, .4);
          e2 = mutate(e2, lw, up, .4);
        end
        # update new population
        cnt += 1;
        newp(cnt, :) = e1;
        cnt += 1;
        newp(cnt, :) = e2;
      end
      # pop old population
      P = newp;
    end
    best_fits_run(rid, :) = best_fits;
    mean_fits_run(rid, :) = mean_fits;
    P = P_tmp;
  end
  best_fits_pop(pid, :) = mean(best_fits_run);
  mean_fits_pop(pid, :) = mean(mean_fits_run);
end

# computation time
dt = time() - st;
printf('Computation time: %fs - %fmin\n\n', dt, (dt / 60));

# save results
csvwrite("DGA_2DG20RaC75p200.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_2DG20RaC50p200.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_2DG20TaC75p200.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_2DG20TaC50p200.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_2DG30RaC75p200.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_2DG30RaC50p200.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_2DG30TaC75p200.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_2DG30TaC50p200.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_5DG40RaC75p450.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_5DG40RaC50p450.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_5DG40TaC75p450.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_5DG40TaC50p450.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                       mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_10DG50RaC75p900.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                        mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_10DG50RaC50p900.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                        mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_10DG50TaC75p900.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                        mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_10DG50TaC50p900.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                        mean(mean_fits_pop)' std(mean_fits_pop)']);
%csvwrite("DGA_10DG50T2p75p900.csv", [squeeze((1:numg))' mean(best_fits_pop)' std(best_fits_pop)' ...
%                                                        mean(mean_fits_pop)' std(mean_fits_pop)']);

# plot results
plotstat(mean(best_fits_pop), mean(mean_fits_pop), numg);