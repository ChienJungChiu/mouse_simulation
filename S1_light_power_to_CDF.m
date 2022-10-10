%{
mouse light power to cdf
Amanda Chiu
Last update:2022/9/19
%}
clc;clear;close all;
data = xlsread('mouse_light_intensity.xls');

%% 770 pdf
%figure;
pdf_770_2D = data(:,2);
x = linspace(0,90,31);
subplot(2,2,1);
plot(data(:,1),pdf_770_2D);
xlabel('Degree');ylabel('Probability');grid on;
title('770nm 2D LED PDF light distribution');
pdf_770_3D = data(:,2).*sin(deg2rad(data(:,1)))*2*pi;
%{
subplot(2,3,3);
plot(data(:,1),pdf_770_3D);
xlabel('Degree');xlim([0,90]);ylabel('Power Density');grid on;
title('770nm 3D LED PDF light distribution');
%}

%% 810 pdf
pdf_810_2D = data(:,3);
x = linspace(0,90,31);
subplot(2,2,2);
plot(data(:,1),pdf_810_2D);
xlabel('Degree');xlim([0,90]);ylabel('Probability');grid on;
title('810nm 2D LED PDF light distribution');
pdf_810_3D = data(:,3).*sin(deg2rad(data(:,1)))*2*pi;
%{
subplot(2,3,5);
plot(data(:,1),pdf_810_3D);
xlabel('Degree');xlim([0,90]);ylabel('Power Density');grid on;
title('810nm 3D LED PDF light distribution');
hold on;
%}

%% 770 cdf
cdf_770_3D = zeros(31,1);
cdf_770_3D(1,1) = pdf_770_3D(1,1);
for i = 2:31
    cdf_770_3D(i,1) = cdf_770_3D(i-1,1) + pdf_770_3D(i,1);
end
cdf_770_3D = cdf_770_3D/cdf_770_3D(31,1);
subplot(2,2,3);
plot(data(:,1),cdf_770_3D);
xlabel('Degree');xlim([0,90]);ylabel('Probability');grid on;
title('770nm 3D LED CDF');

%% 810 cdf
cdf_810_3D = zeros(31,1);
cdf_810_3D(1,1) = pdf_810_3D(1,1);
for i = 2:31
    cdf_810_3D(i,1) = cdf_810_3D(i-1,1) + pdf_810_3D(i,1);
end
cdf_810_3D = cdf_810_3D/cdf_810_3D(31,1);
subplot(2,2,4);
plot(data(:,1),cdf_810_3D);
xlabel('Degree');xlim([0,90]);ylabel('Probability');grid on;
title('810nm 3D LED CDF');



%% interpolation
p_sample = linspace(0,1,10000);
degree = data(:,1);
%delete the last data twice (degree: 84, 87) because of one to one interpolation
cdf_770_3D(29,:) = [];
cdf_770_3D(29,:) = [];
degree(29,:) = [];
degree(29,:) = [];

interpolation_cdf_770_3D = interp1(cdf_770_3D,degree,p_sample,'pchip');
interpolation_cdf_770_3D = interpolation_cdf_770_3D' ;
interpolation_cdf_770_3D = interpolation_cdf_770_3D./180*pi;
writematrix(interpolation_cdf_770_3D, 'interpolation_cdf_770_3D.txt');
p_sample = p_sample';
sample_degree_770 = [p_sample interpolation_cdf_770_3D];


%% interpolation
%t_cdf_810_3D = cdf_810_3D';
p_sample = linspace(0,1,10000);
degree = data(:,1);
%delete the last data twice (degree: 87) because of one to one interpolation
degree(30,:) = [];
cdf_810_3D(30,:) = [];

interpolation_cdf_810_3D = interp1(cdf_810_3D,degree,p_sample,'pchip');
interpolation_cdf_810_3D = interpolation_cdf_810_3D' ;
interpolation_cdf_810_3D = interpolation_cdf_810_3D./180*pi;
writematrix(interpolation_cdf_810_3D, 'interpolation_cdf_810_3D.txt');
p_sample = p_sample';
sample_degree_810 = [p_sample interpolation_cdf_810_3D];