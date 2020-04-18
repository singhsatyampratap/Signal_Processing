%% Load signal
gz = xlsread( '.....');
%%

   
[m,n]=size(gz); % 



%% Applying Cosine Taper
%using mattaper data 
%download it from here 
[gz,win]=mattaper(gz,2,0.5,0);
figure;
surf(gz);
%%

% this is an important part that you were missing....
% basically it Shift zero-frequency component to center of spectrum
%see the example figure in link you will get the idea  
% https://in.mathworks.com/help/matlab/ref/fftshift.html

GZ = fftshift(fft2(gz));

%now you have chnage this also for calculating the power spectrum
Power_GZ = (abs(GZ)/(n*m)).^2;
%%
%if our matrix is not a square,we will make it a square matrix
%square matrix will depend on the dimension of largest edge 
% for eg if m is the largest size we will make a mxm matrix by adding zero
% in n each side to make it square 
% the no of zero will depend on the difference of m-n. 
% Then we will divide it by two and add on both sides  
max_size = max(m,n);

size_diff = abs(m-n);

if m > n                                                                    
if ~mod(size_diff,2)                        % difference is divisible by 2
Power_GZ = [NaN(size_dff/2,m); Power_GZ; NaN(size_diff/2,m)]; 
else           %difference is odd 
Power_GZ = [NaN(floor(size_diff/2),m); Power_GZ; NaN(floor(size_diff/2)+1,m)] 
end
elseif n < m   
    
if ~mod(size_diff,2)                                                
Power_GZ = [NaN(n,size_diff/2) Power_GZ NaN(n,size_diff/2)];                
else
Power_GZ = [NaN(n,floor(size_diff/2)) Power_GZ NaN(n,floor(size_diff/2)+1)];

end
end
m=max_size

%% Calculation of radially averaged power

%now since the fourier transform will be symmetrical about the zero-frequency
% we will work on only on half part the transform

%creating a meshgrid of size mxm  
[X Y] = meshgrid(-m/2:m/2-1, -m/2:m/2-1);

%now since we have to calculate the radially averaged power
% we will change the the coordinate to cylindrical
% so that we can calculate P_avg in each radial bin
[theta rho] = cart2pol(X, Y);     

%note that rho is square matrix not a cylindrical 
% so dividing it into a radial bin will be difficult
% to have a visualisation
% surf(rho)

rho = round(rho);

% now creating a 101 x1 cell or bin that will store the radial power data 
i = cell(floor(m/2) + 1, 1);

% now at different r bin we will divide each cell 
%each cell will contain power spectrum data

% now this r a vector which will be used to find the various  
for r = 0:floor(m/2)
    i{r + 1} = find(rho == r);
end
%for each cell average power is calculated as follows     
P_avg = zeros(1, floor(m/2)+1);
for r = 0:floor(m/2)
    P_avg(1, r + 1) = nanmean( Power_GZ( i{r+1} ) );
end
%%
half_m = floor(m/2) + 1;

%%
max_X = 10^(ceil(log10(half_m)))

f1 = linspace(1,max_X,length(P_avg));



resolution=0.1
%% Generate plot
figure
loglog(f1,P_avg)
title('Radially Averaged Power Spectrum');




