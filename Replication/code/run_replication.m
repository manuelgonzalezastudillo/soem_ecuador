function run_replication(varargin)
% RUN_REPLICATION - Master script for DSGE model replication package
%
% This script orchestrates all 6 steps of the replication package for:
% "Fiscal Consolidations in Commodity-Exporting Countries: A Small Open
%  Economy DSGE Perspective" (Economic Modelling, 2026)
%
% USAGE:
%   run_replication()                          % Run all steps (skip 8-hr estimation)
%   run_replication('run_estimation', true)    % Include full MCMC estimation
%   run_replication('start_from', 4)           % Start from Step 4
%   run_replication('steps', [1 4 5])          % Run only specific steps
%   run_replication('check_only', true)        % Validate environment only
%   run_replication('verbose', true)           % Detailed output
%
% STEPS:
%   1. Data Processing (< 1 min)
%   2. Bayesian MCMC Estimation (~8 hours, OPTIONAL - pre-computed available)
%   3. Shock Decomposition (~5 min)
%   4. Process Results (~2 min)
%   5. IMF Policy Simulations (~5 min)
%   6. Oil Price IRFs (< 1 min)
%
% REQUIREMENTS:
%   - MATLAB R2016a or later
%   - Dynare 4.5 or later
%   - Statistics and Machine Learning Toolbox
%   - Optimization Toolbox
%
% AUTHORS: Manuel González-Astudillo, Juan Guerra-Salas, Avi Lipton
% REPLICATION PACKAGE VERSION: 1.0 (May 2026)

    %% Initialize
    fprintf('\n');
    fprintf('========================================\n');
    fprintf('REPLICATION PACKAGE EXECUTOR\n');
    fprintf('========================================\n');
    fprintf('Paper: Fiscal Consolidations in Commodity-Exporting Countries\n');
    fprintf('Authors: González-Astudillo, Guerra-Salas, Lipton (2026)\n');
    fprintf('========================================\n\n');

    % Start timing
    total_start_time = tic;

    % Parse input arguments
    options = parseInputs(varargin{:});

    % Validate environment
    fprintf('Validating environment...\n');
    [valid, msg] = validateEnvironment(options);
    if ~valid
        error('Environment validation failed:\n%s', msg);
    end
    fprintf('Environment validation: PASSED\n\n');

    % Setup Dynare path
    fprintf('Setting up Dynare path...\n');
    dynare_setup = setupDynarePath();
    if ~dynare_setup
        error('Could not setup Dynare path. Please add Dynare to your MATLAB path manually.');
    end
    fprintf('Dynare setup: SUCCESS\n\n');

    % Check pre-computed results if skipping estimation
    if ~options.run_estimation && any(options.steps >= 3)
        fprintf('Validating pre-computed MCMC results...\n');
        [valid, msg] = validatePrecomputedResults();
        if ~valid
            error('Pre-computed results validation failed:\n%s', msg);
        end
        fprintf('Pre-computed results: FOUND\n\n');
    end

    % Exit if check-only mode
    if options.check_only
        fprintf('========================================\n');
        fprintf('ENVIRONMENT CHECK COMPLETE\n');
        fprintf('All requirements satisfied. Ready to run.\n');
        fprintf('========================================\n\n');
        return;
    end

    % Display execution plan
    displayExecutionPlan(options);

    % Initialize results tracking
    results = struct();
    results.steps_completed = [];
    results.steps_failed = [];
    results.step_times = [];
    results.errors = {};

    %% Execute steps
    fprintf('========================================\n');
    fprintf('STARTING REPLICATION\n');
    fprintf('========================================\n\n');

    % Step 1: Data Processing
    if shouldRunStep(1, options)
        [success, elapsed, err] = executeStep1(options);
        results = recordResult(results, 1, success, elapsed, err);
        if ~success && ~options.continue_on_error
            error('Step 1 failed. Aborting.');
        end
    end

    % Step 2: MCMC Estimation (optional, 8 hours)
    if shouldRunStep(2, options)
        if options.run_estimation
            [success, elapsed, err] = executeStep2(options);
            results = recordResult(results, 2, success, elapsed, err);
            if ~success && ~options.continue_on_error
                error('Step 2 failed. Aborting.');
            end
        else
            fprintf('[2/6] MCMC Estimation... SKIPPED (using pre-computed results)\n');
            fprintf('      (Use ''run_estimation'', true to run ~8 hour estimation)\n\n');
        end
    end

    % Step 3: Shock Decomposition
    if shouldRunStep(3, options)
        [success, elapsed, err] = executeStep3(options);
        results = recordResult(results, 3, success, elapsed, err);
        if ~success && ~options.continue_on_error
            error('Step 3 failed. Aborting.');
        end
    end

    % Step 4: Process Results
    if shouldRunStep(4, options)
        [success, elapsed, err] = executeStep4(options);
        results = recordResult(results, 4, success, elapsed, err);
        if ~success && ~options.continue_on_error
            error('Step 4 failed. Aborting.');
        end
    end

    % Step 5: IMF Simulations
    if shouldRunStep(5, options)
        [success, elapsed, err] = executeStep5(options);
        results = recordResult(results, 5, success, elapsed, err);
        if ~success && ~options.continue_on_error
            error('Step 5 failed. Aborting.');
        end
    end

    % Step 6: Oil Risk IRFs
    if shouldRunStep(6, options)
        [success, elapsed, err] = executeStep6(options);
        results = recordResult(results, 6, success, elapsed, err);
        if ~success && ~options.continue_on_error
            error('Step 6 failed. Aborting.');
        end
    end

    %% Generate summary report
    total_time = toc(total_start_time);
    generateSummaryReport(results, total_time, options);
end

%% Helper Functions

function options = parseInputs(varargin)
    % Parse input arguments with defaults
    p = inputParser;
    addParameter(p, 'run_estimation', false, @islogical);
    addParameter(p, 'start_from', 1, @isnumeric);
    addParameter(p, 'steps', 1:6, @isnumeric);
    addParameter(p, 'check_only', false, @islogical);
    addParameter(p, 'verbose', false, @islogical);
    addParameter(p, 'continue_on_error', false, @islogical);
    addParameter(p, 'show_figures', true, @islogical);

    parse(p, varargin{:});
    options = p.Results;

    % Apply start_from logic to steps
    if options.start_from > 1
        options.steps = options.start_from:6;
    end
end

function should_run = shouldRunStep(step_num, options)
    % Determine if a step should be executed
    should_run = ismember(step_num, options.steps);
end

function results = recordResult(results, step_num, success, elapsed, err)
    % Record step execution result
    if success
        results.steps_completed = [results.steps_completed step_num];
    else
        results.steps_failed = [results.steps_failed step_num];
        results.errors{end+1} = sprintf('Step %d: %s', step_num, err.message);
    end
    results.step_times(step_num) = elapsed;
end

function displayExecutionPlan(options)
    % Display what will be executed
    fprintf('Execution Plan:\n');
    fprintf('  Steps to run: %s\n', mat2str(options.steps));
    if options.run_estimation
        fprintf('  Include estimation: YES (~8 hours)\n');
        fprintf('  Estimated total time: ~8.5 hours\n');
    else
        fprintf('  Include estimation: NO (using pre-computed)\n');
        fprintf('  Estimated total time: ~15 minutes\n');
    end
    fprintf('\n');
end

function [valid, msg] = validateEnvironment(options)
    % Validate MATLAB environment, toolboxes, and file structure
    valid = true;
    msg = '';

    % Check MATLAB version (R2016a = 9.0)
    if verLessThan('matlab', '9.0')
        valid = false;
        msg = [msg 'MATLAB R2016a or later required. Current: ' version '\n'];
    end

    % Check required toolboxes
    toolbox_names = {'Statistics and Machine Learning Toolbox', 'Optimization Toolbox'};
    toolbox_features = {'statistics_toolbox', 'optimization_toolbox'};
    for i = 1:length(toolbox_features)
        if ~license('test', toolbox_features{i})
            valid = false;
            msg = [msg 'Missing: ' toolbox_names{i} '\n'];
        end
    end

    % Check we're in the code/ directory
    [~, current_dir] = fileparts(pwd);
    if ~strcmp(current_dir, 'code')
        valid = false;
        msg = [msg 'Must run from /Replication/code/ directory. Current: ' pwd '\n'];
    end

    % Check required data files exist
    required_data = {'../data/data.xlsx', '../data/IMF_consolidation.xlsx'};
    for i = 1:length(required_data)
        if ~exist(required_data{i}, 'file')
            valid = false;
            msg = [msg 'Missing required file: ' required_data{i} '\n'];
        end
    end

    % Check/create output directory
    if ~exist('../output/figures', 'dir')
        try
            mkdir('../output/figures');
        catch
            valid = false;
            msg = [msg 'Cannot create output directory: ../output/figures\n'];
        end
    end
end

function success = setupDynarePath()
    % Setup Dynare path with auto-detection
    success = false;

    % Check if dynare is already available
    if exist('dynare', 'file')
        fprintf('  Dynare already in path\n');
        success = true;
        return;
    end

    % Try common Dynare installation locations
    possible_paths = {
        '/opt/dynare/4.5.6/lib/dynare/matlab',  % User's known working path
        '/opt/dynare/4.6/lib/dynare/matlab',
        '/opt/dynare/4.5/lib/dynare/matlab',
        '/usr/local/dynare/matlab',
        '~/dynare/matlab',
        '/Applications/Dynare/4.6/matlab',
        '/Applications/Dynare/4.5/matlab'
    };

    for i = 1:length(possible_paths)
        path_expanded = strrep(possible_paths{i}, '~', getenv('HOME'));
        if exist(path_expanded, 'dir')
            fprintf('  Found Dynare at: %s\n', path_expanded);
            addpath(path_expanded);
            if exist('dynare', 'file')
                success = true;
                return;
            end
        end
    end

    % If not found, prompt user
    if ~success
        fprintf('  Dynare not found in common locations.\n');
        fprintf('  Please enter the path to your Dynare installation''s matlab directory\n');
        fprintf('  (e.g., /opt/dynare/4.6/lib/dynare/matlab):\n');
        user_path = input('  Path: ', 's');
        if exist(user_path, 'dir')
            addpath(user_path);
            if exist('dynare', 'file')
                success = true;
                % Save for future use
                try
                    fid = fopen('.dynare_path.txt', 'w');
                    fprintf(fid, '%s', user_path);
                    fclose(fid);
                catch
                    % Ignore save errors
                end
            end
        end
    end
end

function [valid, msg] = validatePrecomputedResults()
    % Check that all pre-computed MCMC files exist
    valid = true;
    msg = '';

    required_files = {
        'SOE_Estimation_mean.mat',
        'SOE_Estimation_mh1_blck1.mat',
        'SOE_Estimation_mh1_blck2.mat',
        'SOE_Estimation_mh2_blck1.mat',
        'SOE_Estimation_mh2_blck2.mat',
        'SOE_Estimation_mh3_blck1.mat',
        'SOE_Estimation_mh3_blck2.mat'
    };

    missing_files = {};
    for i = 1:length(required_files)
        if ~exist(required_files{i}, 'file')
            valid = false;
            missing_files{end+1} = required_files{i};
        end
    end

    if ~valid
        msg = sprintf('Missing pre-computed MCMC files:\n');
        for i = 1:length(missing_files)
            msg = [msg '  - ' missing_files{i} '\n'];
        end
        msg = [msg '\nThese files should be in the code/ directory.\n'];
        msg = [msg 'Either run with ''run_estimation'', true or obtain pre-computed files.\n'];
    end
end

%% Step Execution Functions

function [success, elapsed, err] = executeStep1(options)
    % Execute Step 1: Data Processing
    fprintf('[1/6] Data Processing...');
    if options.verbose
        fprintf('\n');
    end

    success = true;
    err = struct('message', '');

    % Save start time to file (survives clear command)
    start_time = now();
    save('.step_timer.mat', 'start_time');

    try
        % Run data processing script in base workspace to isolate from clear
        evalin('base', 'run(''step1_data_processing.m'')');

        % Load start time back
        timer_data = load('.step_timer.mat');
        elapsed = (now() - timer_data.start_time) * 86400; % Convert days to seconds
        delete('.step_timer.mat');

        if ~options.verbose
            fprintf(' DONE (%.0f sec)\n', elapsed);
        else
            fprintf('      Completed in %.0f sec\n', elapsed);
        end
        fprintf('      Created: ../data/estim_data.xlsx, ../data/IMF_spending.xlsx\n\n');

    catch ME
        % Load start time back
        if exist('.step_timer.mat', 'file')
            timer_data = load('.step_timer.mat');
            elapsed = (now() - timer_data.start_time) * 86400;
            delete('.step_timer.mat');
        else
            elapsed = 0;
        end
        success = false;
        err = ME;
        fprintf(' FAILED\n');
        fprintf('      Error: %s\n', ME.message);
        fprintf('      Troubleshooting: Check that ../data/data.xlsx exists and is readable\n\n');
    end
end

function [success, elapsed, err] = executeStep2(options)
    % Execute Step 2: Bayesian MCMC Estimation (~8 hours)
    fprintf('[2/6] MCMC Estimation (this will take approximately 8 hours)...\n');
    fprintf('      Started: %s\n', datestr(now));
    if options.verbose
        fprintf('      Running Metropolis-Hastings MCMC with 1M draws per chain...\n');
    end

    success = true;
    err = struct('message', '');
    start_time = now();

    try
        % Run Dynare estimation
        if options.verbose
            dynare step2_estimation;
        else
            evalc('dynare step2_estimation');
        end
        elapsed = (now() - start_time) * 86400; % Convert days to seconds

        fprintf('      Completed: %s\n', datestr(now));
        fprintf('      Elapsed time: %.1f hours\n', elapsed/3600);
        fprintf('      Created: SOE_Estimation_*.mat files (203 MB)\n\n');

    catch ME
        elapsed = (now() - start_time) * 86400; % Convert days to seconds
        success = false;
        err = ME;
        fprintf('      FAILED after %.1f hours\n', elapsed/3600);
        fprintf('      Error: %s\n', ME.message);
        fprintf('      Troubleshooting:\n');
        fprintf('        - Check that ../data/estim_data.xlsx exists\n');
        fprintf('        - Ensure sufficient RAM (16-32 GB recommended)\n');
        fprintf('        - Check Dynare log files for details\n\n');
    end
end

function [success, elapsed, err] = executeStep3(options)
    % Execute Step 3: Shock Decomposition
    fprintf('[3/6] Shock Decomposition...');
    if options.verbose
        fprintf('\n');
    end

    success = true;
    err = struct('message', '');
    start_time = now();

    try
        % Run Dynare decomposition
        if options.verbose
            dynare step3_decomposition;
        else
            evalc('dynare step3_decomposition');
        end
        elapsed = (now() - start_time) * 86400; % Convert days to seconds

        if ~options.verbose
            fprintf(' DONE (%.0f sec)\n', elapsed);
        else
            fprintf('      Completed in %.0f sec\n', elapsed);
        end
        fprintf('      Created: SOE_Decomposition_results.mat\n\n');

    catch ME
        elapsed = (now() - start_time) * 86400; % Convert days to seconds
        success = false;
        err = ME;
        fprintf(' FAILED\n');
        fprintf('      Error: %s\n', ME.message);
        fprintf('      Troubleshooting: Check that MCMC results exist (Step 2 output)\n\n');
    end
end

function [success, elapsed, err] = executeStep4(options)
    % Execute Step 4: Process Results
    fprintf('[4/6] Process Results...');
    if options.verbose
        fprintf('\n');
    end

    success = true;
    err = struct('message', '');

    % Save start time to file (survives clear command)
    start_time = now();
    save('.step_timer.mat', 'start_time');

    try
        % Suppress figures if requested
        if ~options.show_figures
            set(0,'DefaultFigureVisible','off');
        end

        % Run results processing script in base workspace to isolate from clear
        evalin('base', 'run(''step4_process_results.m'')');

        % Load start time back
        timer_data = load('.step_timer.mat');
        elapsed = (now() - timer_data.start_time) * 86400;
        delete('.step_timer.mat');

        % Restore figure visibility
        if ~options.show_figures
            set(0,'DefaultFigureVisible','on');
        end

        if ~options.verbose
            fprintf(' DONE (%.0f sec)\n', elapsed);
        else
            fprintf('      Completed in %.0f sec\n', elapsed);
        end
        fprintf('      Created: Figures in ../output/figures/\n');
        fprintf('      Console output: Model vs. data moments, variance decomposition\n\n');

    catch ME
        % Load start time back
        if exist('.step_timer.mat', 'file')
            timer_data = load('.step_timer.mat');
            elapsed = (now() - timer_data.start_time) * 86400;
            delete('.step_timer.mat');
        else
            elapsed = 0;
        end
        success = false;
        err = ME;
        if ~options.show_figures
            set(0,'DefaultFigureVisible','on');
        end
        fprintf(' FAILED\n');
        fprintf('      Error: %s\n', ME.message);
        fprintf('      Troubleshooting: Check that SOE_Decomposition_results.mat exists\n\n');
    end
end

function [success, elapsed, err] = executeStep5(options)
    % Execute Step 5: IMF Policy Simulations
    fprintf('[5/6] IMF Policy Simulations...');
    if options.verbose
        fprintf('\n');
        fprintf('      Running 7+ fiscal consolidation scenarios...\n');
    end

    success = true;
    err = struct('message', '');

    % Save start time to file (survives clear command)
    start_time = now();
    save('.step_timer.mat', 'start_time');

    try
        % Suppress figures if requested
        if ~options.show_figures
            set(0,'DefaultFigureVisible','off');
        end

        % Run IMF simulations script in base workspace to isolate from clear
        evalin('base', 'run(''step5_imf_simulations.m'')');

        % Load start time back
        timer_data = load('.step_timer.mat');
        elapsed = (now() - timer_data.start_time) * 86400;
        delete('.step_timer.mat');

        % Restore figure visibility
        if ~options.show_figures
            set(0,'DefaultFigureVisible','on');
        end

        if ~options.verbose
            fprintf(' DONE (%.0f sec)\n', elapsed);
        else
            fprintf('      Completed in %.0f sec\n', elapsed);
        end
        fprintf('      Created: Multiple IRF figures (*.eps files)\n\n');

    catch ME
        % Load start time back
        if exist('.step_timer.mat', 'file')
            timer_data = load('.step_timer.mat');
            elapsed = (now() - timer_data.start_time) * 86400;
            delete('.step_timer.mat');
        else
            elapsed = 0;
        end
        success = false;
        err = ME;
        if ~options.show_figures
            set(0,'DefaultFigureVisible','on');
        end
        fprintf(' FAILED\n');
        fprintf('      Error: %s\n', ME.message);
        fprintf('      Troubleshooting:\n');
        fprintf('        - Check that ../data/IMF_consolidation.xlsx exists\n');
        fprintf('        - Verify MCMC results are available\n\n');
    end
end

function [success, elapsed, err] = executeStep6(options)
    % Execute Step 6: Oil Risk IRFs
    fprintf('[6/6] Oil Risk IRFs...');
    if options.verbose
        fprintf('\n');
        fprintf('      (Re-running decomposition internally - this is normal)\n');
    end

    success = true;
    err = struct('message', '');

    % Save start time to file (survives clear command)
    start_time = now();
    save('.step_timer.mat', 'start_time');

    try
        % Suppress figures if requested
        if ~options.show_figures
            set(0,'DefaultFigureVisible','off');
        end

        % Run oil risk IRF script in base workspace to isolate from clear
        evalin('base', 'run(''step6_oil_risk_irf.m'')');

        % Load start time back
        timer_data = load('.step_timer.mat');
        elapsed = (now() - timer_data.start_time) * 86400;
        delete('.step_timer.mat');

        % Restore figure visibility
        if ~options.show_figures
            set(0,'DefaultFigureVisible','on');
        end

        if ~options.verbose
            fprintf(' DONE (%.0f sec)\n', elapsed);
        else
            fprintf('      Completed in %.0f sec\n', elapsed);
        end
        fprintf('      Created: oil_irf.eps, risk_irf.eps\n\n');

    catch ME
        % Load start time back
        if exist('.step_timer.mat', 'file')
            timer_data = load('.step_timer.mat');
            elapsed = (now() - timer_data.start_time) * 86400;
            delete('.step_timer.mat');
        else
            elapsed = 0;
        end
        success = false;
        err = ME;
        if ~options.show_figures
            set(0,'DefaultFigureVisible','on');
        end
        fprintf(' FAILED\n');
        fprintf('      Error: %s\n', ME.message);
        fprintf('      Troubleshooting: Check that MCMC results are available\n\n');
    end
end

function generateSummaryReport(results, total_time, options)
    % Generate final summary report
    fprintf('========================================\n');
    fprintf('REPLICATION COMPLETE\n');
    fprintf('========================================\n');
    fprintf('Total time: %.1f minutes (%.0f seconds)\n', total_time/60, total_time);
    fprintf('\n');

    % Steps completed
    if ~isempty(results.steps_completed)
        fprintf('Steps completed successfully: %s\n', mat2str(results.steps_completed));
        for i = 1:length(results.steps_completed)
            step = results.steps_completed(i);
            if step <= length(results.step_times) && results.step_times(step) > 0
                fprintf('  Step %d: %.0f sec\n', step, results.step_times(step));
            end
        end
    end

    % Steps failed
    if ~isempty(results.steps_failed)
        fprintf('\nSteps FAILED: %s\n', mat2str(results.steps_failed));
        for i = 1:length(results.errors)
            fprintf('  %s\n', results.errors{i});
        end
    end

    % Expected outputs
    fprintf('\n');
    fprintf('Expected outputs:\n');
    fprintf('  Data files:\n');
    fprintf('    - ../data/estim_data.xlsx\n');
    fprintf('    - ../data/IMF_spending.xlsx\n');
    fprintf('  Figures:\n');
    fprintf('    - ../output/figures/*.eps (shock decomposition)\n');
    fprintf('    - *.eps files in current directory (IRFs)\n');
    fprintf('  Result files:\n');
    if options.run_estimation
        fprintf('    - SOE_Estimation_*.mat (MCMC results)\n');
    end
    fprintf('    - SOE_Decomposition_results.mat\n');

    fprintf('\n');
    fprintf('========================================\n');
    fprintf('For questions, see README.md or contact:\n');
    fprintf('  Juan Guerra-Salas: jguerra@bcentral.cl\n');
    fprintf('========================================\n\n');
end
