%==========================================================================
% A sample 2D MCX simulation
%
% Author: Qianqian Fang <q.fang at neu.edu>
%==========================================================================

% you must define a 3D array with one singleton dimension (with length 1).
% unfortunately if you define z as singleton, matlab will make the array 2D
% instead of 3D, so we have to purmute it to make the 1st dimension
% singleton.

cfg.nphoton=1e6;

cfg.vol=permute(uint8(ones(190,496)), [3,1,2]); % from 2d to 3d
cfg.vol(1,30:70, 10:50)=2;
cfg.issrcfrom0=1;
cfg.srctype='anglepattern';
cfg.srcparam1=[10000 0 0 0];
cfg.srcparam2=[0 0 0 0];
cfg.srcpattern = load('interpolation_cdf_810_3D.txt');

cfg.srcpos=[0,0, 10];   % src position must be located in the 2D plane
cfg.srcdir=[0 1 0];    % src dir must align in the plan (y-z in this case)

cfg.gpuid=1;
cfg.autopilot=1;
cfg.gscatter=100;

myprop=[0.02 0.1 0.9 1.37; 0.02 10 0.9 1.37*5];

cfg.prop=[0.0186 11.1 0.9 1.37];
cfg.tstart=0;
cfg.tend=1e-8;
cfg.tstep=1e-8;
%cfg.detpos=[0,0,0,2000]
%[fluence,detphoton,vol,seed,trajectory]=mcxlab(cfg);
flux=mcxlab(cfg);

cw=squeeze(sum(flux.data,4));
figure;
imagesc(log10(abs(cw)))