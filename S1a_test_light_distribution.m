%{
test simulation light source
Last update: 2022/10/4
%}

clear cfg; clear all; close all;

cfg.vol = uint8(zeros(64,64,64));
cfg.vol(17:64,:,:) = 1;


cfg.prop=[
    0 0 1 1
    2 5.1 0.9 1.37
];



cfg.srctype='anglepattern';
cfg.srcpos=[16.0 32.0 33.0];


cfg.srcparam1=[10000 0 0 0];
cfg.srcpattern = load('interpolation_cdf_810_3D.txt');  %change here for different cdf

cfg.srcdir=[1 0 0];  
cfg.issrcfrom0=1;

cfg.tstart=0;
cfg.tend=5e-9;
cfg.tstep=5e-9;
cfg.nphoton=1e8;
cfg.autopilot=1;
cfg.gpuid=1;
cfg.unitinmm=0.4*2;
cfg.debuglevel='P';
cfg.outputtype = 'energy';

%mcxpreview(cfg);

flux_energy=mcxlab(cfg);
fcw=flux_energy.data;

z_section_810 = fcw(:,32,:);
z_section_810 = reshape(z_section_810,64,64);
z_section_810 = z_section_810';

colormap(jet);
imagesc(log10(z_section_810));
title('810 z distribution');
c = colorbar;
hold on;

figure;
x_section_810 = fcw(25,:,:);
x_section_810 = reshape(x_section_810,64,64);
x_section_810 = x_section_810';
imagesc(log10(x_section_810));
title('810 x distribution');
colormap(jet);
c = colorbar;
%saveas(gcf,'20221005.jpg')