function [time,timeperpanel] = smartSolution(Bomb)

Solution = BombSolution(Bomb);

[Wsol, dt] = WiresSolutionFindTdelay(Bomb);
time = dt;
timeperpanel(1) = dt;

[Ssol, dt] = switchesSolutionFindTdelay(Bomb);
time = time + dt;
timeperpanel(2) = dt;

[Bsol, dt] = ButtonRulesTdelay(Bomb);
time = time + dt;
timeperpanel(3) = dt;

[Nsol, dt] = numpadSolutionTdelay(Solution,Bomb);
time = time + dt;
timeperpanel(4) = dt;
