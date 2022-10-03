%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MCXLAB - Monte Carlo eXtreme for MATLAB/Octave by Qianqina Fang
%
% In this example, we demonstrate light transport simulation in a digital
% mouse atlas - Digimouse
%
% This demo is similar to the MCX simulation used for Fig. 2 in
% [Fang2012], except this uses a voxelated model instead of a mesh.
% 
%
% [Fang2012] Qianqian Fang and David R. Kaeli, "Accelerating mesh-based
% Monte Carlo method on modern CPU architectures ," Biomed. Opt. Express
% 3(12), 3223-3230 (2012)  
%
% This file is part of Monte Carlo eXtreme (MCX) URL:http://mcx.sf.net
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Updater: Amanda Chiu
Last Updated Date: 2022/9/26

%}

clear cfg; clear all; close all;

load digimouse.mat
cfg.vol=digimouse;

cfg.prop=[1 0.0191 6.6 0.9 1.37
2 0.0136 8.6 0.9 1.37
3 0.0026 0.01 0.9 1.37
4 0.0186 11.1 0.9 1.37
5 0.0186 11.1 0.9 1.37
6 0.0186 11.1 0.9 1.37
7 0.0186 11.1 0.9 1.37
8 0.0186 11.1 0.9 1.37
9 0.0240 8.9  0.9 1.37
10 0.0026 0.01 0.9 1.37
11 0.0240 8.9  0.9 1.37
12 0.0240 8.9  0.9 1.37
13 0.0240 8.9  0.9 1.37
14 0.0240 8.9  0.9 1.37
15 0.0240 8.9  0.9 1.37
16 0.072  5.6 0.9 1.37
17 0.072  5.6 0.9 1.37
18 0.072  5.6 0.9 1.37
19 0.050  5.4 0.9 1.37
20 0.024  8.9 0.9 1.37
21 0.076 10.9 0.9 1.37];

cfg.prop(:,1)=[];
cfg.prop(2:end+1,:)=cfg.prop;
cfg.prop(1,:)=[0 0 1 1];

cfg.srctype='anglepattern';
cfg.srcpos=[90.0 115.0 100.0]; %up 
%cfg.srcpos=[45.0 115.0 50.0]; %left
%cfg.srcpos=[160.0 115.0 50.0]; %right

cfg.srcparam1=[10000 0 0 0];
cfg.srcpattern = load('interpolation_cdf_770_3D.txt');  %change here for different cdf

cfg.srcdir=[0 0 -1];  %up
%cfg.srcdir=[-1 0 0]; %left
%cfg.srcdir=[1 0 0];   %right
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

flux_energy=mcxlab(cfg);
fcw=flux_energy.data;
filename = '770_up_mouse_20220926.mat';
save(filename)

mcxplotvol(log10(fcw));
colormap(jet);
mcxpreview(cfg);

%{
left_pic = fcw(50,:,:);
left_pic = reshape(left_pic,496,104);
left_pic = left_pic';

for i = 1:104
    for j = 1:496
        if left_pic(i,j) == 0
            %colormap white;
            left_pic(i,j) = -21;
        else
            left_pic(i,j) = (log10(left_pic(i,j)));
        end
    end
end

imagesc(left_pic);
set(gca,'YDir','normal'); 

colormap(jet);
%{
lim = caxis;
caxis([-20, lim(1,2)])
%}
%colormap blue = colormap white;
c = colorbar;
c.Label.String = 'Scale: log10';


%mcx2json(cfg,'digimouse.json');
%}