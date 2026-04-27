% Initialize start and end dates
startYear = 2007; startMonth = 8;   % August 2007
endYear   = 2024; endMonth   = 11;  % November 2024

baseURL = 'https://contenido.bce.fin.ec/documentos/Estadisticas/SectorMonFin/TasasInteres/TasasVigentes';

% Initialize arrays to store results
datesArray = []; 
ratesArray = [];

% Loop over the years and months
for yr = startYear:endYear
    % Determine the first and last month for the given year
    if yr == startYear
        mStart = startMonth;
    else
        mStart = 1;
    end
    
    if yr == endYear
        mEnd = endMonth;
    else
        mEnd = 12;
    end
    
    for mm = mStart:mEnd
        % Construct the month-year string
        MM = sprintf('%02d', mm);
        YYYY = sprintf('%04d', yr);
        
        % Construct the URL
        url = [baseURL MM YYYY '.htm'];
        
        % Attempt to read the webpage
        try
            opts = weboptions('UserAgent','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0','CertificateFilename','');
            pageText = webread(url,opts);
        catch
            % If the page doesn't exist or can't be read, skip
            warning('Could not read URL: %s. Skipping...', url);
            continue;
        end
        
        % The phrase might be "Pasiva Referencial" or "Tasa Pasiva Referencial"
        % Try to find a line containing that phrase and a following number.
        % Example pattern: look for something like "Pasiva Referencial" followed by 
        % some whitespace and then a number (could be X.XX or XX.XX etc.).
        
        pattern = '(Pasiva Referencial|Tasa Pasiva Referencial)[^0-9]*([0-9]+\.[0-9]+)';
        tokens = regexp(pageText, pattern, 'tokens', 'once');
        
        if ~isempty(tokens)
            % tokens{2} should be the rate
            rateValue = str2double(tokens{2});
            
            % Store the date and rate
            dateNum = datenum(yr, mm, 1);
            datesArray = [datesArray; dateNum];
            ratesArray = [ratesArray; rateValue];
        else
            % If no match found, you may want to inspect the page to adjust the pattern.
            warning('No "Pasiva Referencial" rate found for %s-%s.', MM, YYYY);
        end
    end
end

% Convert dates to year-month labels
yearMonth = datestr(datesArray, 'yyyy-mm');

% Create a table with the results
T = table(yearMonth, ratesArray, 'VariableNames', {'Fecha','Tasa_de_interes'});

% Display the first few rows
disp(T(1:10,:));

% You can also write the table to a file, e.g.:
% writetable(T, 'Tasas_Pasivas_Referenciales_2007_2024.csv');