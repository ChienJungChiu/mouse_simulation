%{
add three sources together
energy density

Amanda Chiu
Last Updated: 2022/9/26
%}

clc;clear; close all;

wl = 2;
model = load('digimouse.mat');
model_size = size(model.digimouse); 
OP = model.prop;
%% energy from portion/mm^3 into 80 mW/mm^3(LED)
load('770_left_mouse_20230317.mat', 'flux_energy');
left_source_770 = flux_energy.data*80;
%imagesc(log10(reshape(left_source_770(:,115,:),190,104)))

load('770_up_mouse_20230317.mat', 'flux_energy');
up_source_770 = flux_energy.data*80;

load('770_right_mouse_20230317.mat', 'flux_energy');
right_source_770 = flux_energy.data*80;

total_770_energy_density = left_source_770 + up_source_770 + right_source_770;
sum_770 = sum(total_770_energy_density,'all');


load('810_left_mouse_20230317.mat', 'flux_energy');
left_source_810 = flux_energy.data*80;

load('810_up_mouse_20230317.mat', 'flux_energy');
up_source_810 = flux_energy.data*80;

load('810_right_mouse_20230317.mat', 'flux_energy');
right_source_810 = flux_energy.data*80;

total_810_energy_density = left_source_810 + up_source_810 + right_source_810;
sum_810 = sum(total_810_energy_density,'all');


%% turn energy into flux, unit: J/mm^2
for i = 1 : wl
    for x = 1:model_size(1)
        for y = 1:model_size(2)
            for z = 1:model_size(3)
                if model.digimouse(x,y,z) == 1
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(1,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(1,2);
                elseif model.digimouse(x,y,z) == 2
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(2,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(2,2);
                elseif model.digimouse(x,y,z) == 3
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(3,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(3,2);
                elseif model.digimouse(x,y,z) == 4
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(4,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(4,2);
                elseif model.digimouse(x,y,z) == 5
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(5,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(5,2);
                elseif model.digimouse(x,y,z) == 6
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(6,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(6,2);
                elseif model.digimouse(x,y,z) == 7
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(7,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(7,2);
                elseif model.digimouse(x,y,z) == 8
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(8,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(8,2);
                elseif model.digimouse(x,y,z) == 9
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(9,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(9,2);
                elseif model.digimouse(x,y,z) == 10
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(10,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(10,2);
                elseif model.digimouse(x,y,z) == 11
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(11,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(11,2);
                elseif model.digimouse(x,y,z) == 12
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(12,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(12,2);
                elseif model.digimouse(x,y,z) == 13
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(13,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(13,2);
                elseif model.digimouse(x,y,z) == 14
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(14,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(14,2);
                elseif model.digimouse(x,y,z) == 15
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(15,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(15,2);
                elseif model.digimouse(x,y,z) == 16
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(16,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(16,2);
                elseif model.digimouse(x,y,z) == 17
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(17,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(17,2);
                elseif model.digimouse(x,y,z) == 18
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(18,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(18,2);
                elseif model.digimouse(x,y,z) == 19
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(19,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(19,2);
                elseif model.digimouse(x,y,z) == 20
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(20,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(20,2);
                elseif model.digimouse(x,y,z) == 21
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z)./OP(21,2);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z)./OP(21,2);
                else
                    fluence_770(x,y,z) = total_770_energy_density(x,y,z);
                    fluence_810(x,y,z) = total_810_energy_density(x,y,z);
                end
            end
        end
    end
    
end
save('770fluence_digimouse.mat','fluence_770');
save('810fluence_digimouse.mat','fluence_810');

%% turn (total power of each LED) unit from 80mw/mm^2 into 80mw/cm^2 -> *100
fluence_770 = fluence_770*100;
mcxplotvol(log10(fluence_770));
colormap(jet);
title('total 770nm fluence rate(mW/cm^2)');
c = colorbar;
c.Label.String = 'log_{10} scale with unit: mW/cm^2';

filename = 'real_total_770_fluence_rate';
save(filename,'fluence_770');

figure;
cross_section_770 = fluence_770(:,115,:);
cross_section_770 = reshape(cross_section_770,190,104);
cross_section_770 = cross_section_770';
colormap(jet);
imagesc(log10(cross_section_770));
title('770nm fluence rate(mW/cm^2) cross section');
xlabel('X axis(cm)');ylabel('Z axis(cm)');axis equal

% yticks(7) = [];
ylim([0 100]);   % set the range of y-axis
xtickslabel = xticks*0.02;
ytickslabel = yticks*0.02;
c = colorbar;
c.Label.String = 'log_{10} scale with unit: mW/cm^2';
set(gca,'YDir','normal','xticklabel',xtickslabel,'yticklabel',ytickslabel);

hold on;  
saveas(gcf,'770_cross_section.jpg'); %better save the pics by yourself or else the format could change

sup = 0;
hop = 0;
for k = 90:99
    for i = 81:84
        sup = sup + cross_section_770(i,k);
    end
    for t = 71:74
        hop = hop + cross_section_770(t,k);
    end
    
end 
%% three source from default W/(m^2) to LRS 80 mW/(cm^2) => *0.8
fluence_810 = fluence_810*100;
mcxplotvol(log10(fluence_810));
colormap(jet);
title('total 810nm fluence rate(mW/cm^2)');
caxis('manual');
c.Label.String = 'log_{10} scale with unit: mW/cm^2';

filename = 'real_total_810_fluence_rate';
save(filename,'total_810_energy_density');

figure;
cross_section_810 = fluence_810(:,115,:);
cross_section_810 = reshape(cross_section_810,190,104);
cross_section_810 = cross_section_810';

colormap(jet);
imagesc(log10(cross_section_810));
title('810nm fluence rate(mW/cm^2) cross section');
xlabel('X axis(cm)');ylabel('Z axis(cm)');axis equal
ylim([0 100]);   % set the range of y-axis
xtickslabel = xticks*0.02;
ytickslabel = yticks*0.02;
c = colorbar;
c.Label.String = 'log_{10} scale with unit: mW/cm^2';
set(gca,'YDir','normal','xticklabel',xtickslabel,'yticklabel',ytickslabel);

saveas(gcf,'810_cross_section.jpg'); %better save the pics by yourself or else the format could change

