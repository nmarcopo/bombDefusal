function [attempts,simtime] = runSimulation(handles)

loop = str2double(handles.numBombs.String);
dt = str2double(handles.dtText.String);

% runs new simulation
if handles.startButton.Value == 1
    cla
    handles.trialText.String = '0';
    hwb = waitbar(0, 'Running Simulation', 'Name', 'Simulation In Progress');
    for i = 1:loop
        Bomb = BombGenerator;
        Solution = BombSolution(Bomb);
        
        timer = cputime;
        [elapsed, attempts(i,1), simtime(i,1), timeperpanel(i,1,1:4)] = Randomizer(Solution,dt);
        compTime(i,1) = cputime - timer;
        
        timer = cputime;
        [attempts(i,2),simtime(i,2),timeperpanel(i,2,1:4)] = BruteForce(Solution,dt);
        compTime(i,2) = cputime - timer;
        
        timer = cputime;
        [smarttime, timeperpanel(i,3,1:4)] = smartSolution(Bomb);
        compTime(i,3) = cputime - timer;
        
        waitbar(i/loop, hwb);
        save('tempSimData','attempts','simtime','loop','timeperpanel','i','compTime')
        handles.trialText.String = num2str(str2double(handles.trialText.String)+1);
        
        avetimeperpanel = [sum(timeperpanel(:,1,1))/i,...
            sum(timeperpanel(:,2,1))/i, ...
            sum(timeperpanel(:,3,1))/i; ...
            sum(timeperpanel(:,1,2))/i, ...
            sum(timeperpanel(:,2,2))/i, ...
            sum(timeperpanel(:,3,2))/i; ...
            sum(timeperpanel(:,1,3))/i, ...
            sum(timeperpanel(:,2,3))/i, ...
            sum(timeperpanel(:,3,3))/i; ...
            sum(timeperpanel(:,1,4))/i, ...
            sum(timeperpanel(:,2,4))/i, ...
            sum(timeperpanel(:,3,4))/i; ...
            sum(sum(timeperpanel(:,1,1:4)))/i, ...
            sum(sum(timeperpanel(:,2,1:4)))/i, ...
            sum(sum(timeperpanel(:,3,1:4)))/i];
        
        handles.aveRandText.String = num2str(sum(sum(timeperpanel(:,1,1:4)))/i);
        handles.aveBruteText.String = num2str(sum(sum(timeperpanel(:,2,1:4)))/i);
        handles.aveRuleText.String = num2str(sum(sum(timeperpanel(:,3,1:4)))/i);
        
        handles.failedRandText.String = num2str(sum(attempts(:,1)));
        handles.failedBruteText.String = num2str(sum(attempts(:,2)));
        
        
        aveCompTime = [sum(compTime(:,1))/i,sum(compTime(:,2))/i,sum(compTime(:,3))/i];
        handles.randCompT.String = num2str(aveCompTime(1));
        handles.bruteCompT.String = num2str(aveCompTime(2));
        handles.ruleCompT.String = num2str(aveCompTime(3));
        
        allAttempts = [sum(attempts(:,1)),sum(attempts(:,2))];
        
        bar(handles.resultAxes,avetimeperpanel);
        grid(handles.resultAxes,'on');
        ylabel('Simulated time to complete task (s)');
        set(gca,'xticklabel',{'Wires','Switches','Buttons','Numpad','Total Time'});
        legend(handles.resultAxes,'Randomizer','Brute Force','Rule Abider','Location','Northwest');
        
    end
    delete(hwb)
    bar(handles.resultAxes,avetimeperpanel);
    grid(handles.resultAxes,'on');
    ylabel('Simulated time to complete task (s)');
    set(gca,'xticklabel',{'Wires','Switches','Buttons','Numpad','Total Time'});
    legend(handles.resultAxes,'Randomizer','Brute Force','Rule Abider','Location','Northwest');
end

% continues from loaded simulation
if handles.start2Button.Value == 1
    load('simData','attempts','simtime','timeperpanel')
    hwb = waitbar(0, 'Running Simulation', 'Name', 'Simulation In Progress');
    asize = size(attempts,1);
    for i = asize:loop+asize
        Bomb = BombGenerator;
        Solution = BombSolution(Bomb);
        timer = cputime;
        [elapsed, attempts(i,1), simtime(i,1), timeperpanel(i,1,1:4)] = Randomizer(Solution,dt);
        compTime(i,1) = cputime - timer;
        
        timer = cputime;
        [attempts(i,2),simtime(i,2),timeperpanel(i,2,1:4)] = BruteForce(Solution,dt);
        compTime(i,2) = cputime - timer;
        
        timer = cputime;
        [smarttime, timeperpanel(i,3,1:4)] = smartSolution(Bomb);
        compTime(i,3) = cputime - timer;
        
        waitbar(i/(loop+asize), hwb);
        save('tempSimData','attempts','simtime','loop','timeperpanel','i','compTime')
        handles.trialText.String = num2str(length(attempts));
        
        avetimeperpanel = [sum(timeperpanel(:,1,1))/i,...
            sum(timeperpanel(:,2,1))/i, ...
            sum(timeperpanel(:,3,1))/i; ...
            sum(timeperpanel(:,1,2))/i, ...
            sum(timeperpanel(:,2,2))/i, ...
            sum(timeperpanel(:,3,2))/i; ...
            sum(timeperpanel(:,1,3))/i, ...
            sum(timeperpanel(:,2,3))/i, ...
            sum(timeperpanel(:,3,3))/i; ...
            sum(timeperpanel(:,1,4))/i, ...
            sum(timeperpanel(:,2,4))/i, ...
            sum(timeperpanel(:,3,4))/i; ...
            sum(sum(timeperpanel(:,1,1:4)))/i, ...
            sum(sum(timeperpanel(:,2,1:4)))/i, ...
            sum(sum(timeperpanel(:,3,1:4)))/i];
        
        handles.aveRandText.String = num2str(sum(sum(timeperpanel(:,1,1:4)))/i);
        handles.aveBruteText.String = num2str(sum(sum(timeperpanel(:,2,1:4)))/i);
        handles.aveRuleText.String = num2str(sum(sum(timeperpanel(:,3,1:4)))/i);
        
        handles.failedRandText.String = num2str(sum(attempts(:,1)));
        handles.failedBruteText.String = num2str(sum(attempts(:,2)));
        
        
        aveCompTime = [sum(compTime(:,1))/i,sum(compTime(:,2))/i,sum(compTime(:,3))/i];
        handles.randCompT.String = num2str(aveCompTime(1));
        handles.bruteCompT.String = num2str(aveCompTime(2));
        handles.ruleCompT.String = num2str(aveCompTime(3));
        
        allAttempts = [sum(attempts(:,1)),sum(attempts(:,2))];
        
        bar(handles.resultAxes,avetimeperpanel);
        grid(handles.resultAxes,'on');
        ylabel('Simulated time to complete task (s)');
        set(gca,'xticklabel',{'Wires','Switches','Buttons','Numpad','Total Time'});
        legend(handles.resultAxes,'Randomizer','Brute Force','Rule Abider','Location','Northwest');
    end
    delete(hwb)
    
    
    
    bar(handles.resultAxes,avetimeperpanel);
    grid(handles.resultAxes,'on');
    ylabel('Simulated time to complete task (s)');
    set(gca,'xticklabel',{'Wires','Switches','Buttons','Numpad','Total Time'});
    legend(handles.resultAxes,'Randomizer','Brute Force','Rule Abider','Location','Northwest');
end
