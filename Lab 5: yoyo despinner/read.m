%Author: Ben Hagenau
%Created: 3/21/17
%PURPOSE: Read in data files for yoyo despinner lab [time,rpm]

function [DATA] = read

%read in data
for i = [0, 8, 10, 11, 12, 135, 136, 1375, 13]
    DATA.R100.(sprintf('L%d',i)) = load(sprintf('100_RPM_%d_INCH.txt',i));
    DATA.R100.(sprintf('L%d',i))(:,2) = DATA.R100.(sprintf('L%d',i))(:,2)*(2*pi/60);
    DATA.R100.(sprintf('L%d',i))(:,1) = (DATA.R100.(sprintf('L%d',i))(:,1) - DATA.R100.(sprintf('L%d',i))(1,1));
end

DATA.R105.L136 = load('105_RPM_13.6_INCH');
DATA.R105.L136(:,2) = DATA.R105.L136(:,2)*(2*pi/60);
DATA.R90.L136 = load('90_RPM_13.6_INCH');
DATA.R90.L136(:,2) = DATA.R90.L136(:,2)*(2*pi/60);
DATA.R80.L0 = load('80_RPM_NoMass');
DATA.R80.L0(:,2) = DATA.R80.L0(:,2)*(2*pi/60);


