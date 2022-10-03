%{
add three sources together
energy density

Amanda Chiu
Last Updated: 2022/9/26
%}

clc;clear; close all;


load('770_left_mouse_20220926.mat', 'flux_energy');
left_source_770 = flux_energy.data;
%imagesc(log10(reshape(left_source_770(:,115,:),190,104)))

load('770_up_mouse_20220926.mat', 'flux_energy');
up_source_770 = flux_energy.data;

load('770_right_mouse_20220926.mat', 'flux_energy');
right_source_770 = flux_energy.data;

total_770_energy_density = left_source_770 + up_source_770 + right_source_770;
%sum_770 = sum(total_770_energy_density,'all');


load('810_left_mouse_20220926.mat', 'flux_energy');
left_source_810 = flux_energy.data;

load('810_up_mouse_20220926.mat', 'flux_energy');
up_source_810 = flux_energy.data;

load('810_right_mouse_20220926.mat', 'flux_energy');
right_source_810 = flux_energy.data;

total_810_energy_density = left_source_810 + up_source_810 + right_source_810;
%sum_810 = sum(total_810_energy_density,'all');

%% three sources from default W/(m^2) to LRS 30 mW/(cm^2) => *1/10*30/3 = 1        
mcxplotvol(log10(total_770_energy_density));
colormap(jet);
title('total 770nm fluence rate(mW/(cm)^2)');
c = colorbar;
c.Label.String = 'log10 scale';

cross_section_770 = total_770_energy_density(:,115,:);
cross_section_770 = reshape(cross_section_770,190,104);
cross_section_770 = cross_section_770';
filename = 'total_770_fluence_rate_cross_section';
save(filename)
colormap(jet);
imagesc(log10(cross_section_770));
%subplot(1,2,1);
title('770nm fluence rate(mW/(cm)^2) cross section');
c = colorbar;
c.Label.String = 'log10 scale';
set(gca,'YDir','normal');   
hold on;

%% three source from default W/(m^2) to LRS 30 mW/(cm^2) => *1/10*30/3 = 1 
mcxplotvol(log10(total_810_energy_density));
colormap(jet);
title('total 810nm fluence rate(mW/(cm)^2)');
caxis('manual');
c.Label.String = 'log10 scale';

cross_section_810 = total_810_energy_density(:,115,:);
cross_section_810 = reshape(cross_section_810,190,104);
cross_section_810 = cross_section_810';
filename = 'total_810_fluence_rate_cross_section';
save(filename)
colormap(jet);
imagesc(log(cross_section_810));
%subplot(1,2,2);
title('810nm fluence rate(mW/(cm)^2) cross section');
c = colorbar;
c.Label.String = 'log10 scale';
set(gca,'YDir','normal');   
save digimouse_parameters
