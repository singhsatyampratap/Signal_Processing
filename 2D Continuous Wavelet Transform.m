% loading the data
data = xlsread( '...');

%performing 2d wavelet Transform
cwtft2struct=cwtft2(data);

%extracting the cfs matrix
cfsmat=cwtft2struct.cfs;

% now this is 4d matrix with size 201 201 1 6
size(cfsmat)

% there are different  scales to it are as follows
cwtft2struct.scales
% 1 2 4 8 16 32 
% you can change these scles too using following command
cwtnew = cwtft2(data, 3:0.5:8);

% if we want to extract the coeff. at any particular scale
%lets say 8 your command will be 
coeff_at_8=cfsmat(:,:,1,4);
 % you can think it of as a 201 X 201 matrix( depends on data volume) 
 % with n layer depend on the scale you choose by default I guess there are six scales. 

 
 % plotting the data at scale 8
 surf(abs(coeff_at_8).^2);
