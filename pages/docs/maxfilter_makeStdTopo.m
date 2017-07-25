function makeStdTopo(D,dolog,magGrad,osldir,badchans)
%
% D - D object filename, or D object
% dolog - 1 to take log, 0 otherwise
% magGrad - 1 for combined grads, 0 for mags
% badchans - a list of badchannels as would be obtained if you did
% D.badchannels

if nargin > 3
    hasdir = 1;
else
    hasdir = 0;
    osldir = OSLDIR;
end

if ischar(D)
    D  = spm_eeg_load(D);
end

data = D.ftraw(0);

%% now shoehorn this data into fieldtrip format

% have added extra channels to the D-object.  Remove these...
data.label = data.label(1:330);
for iTrial = 1:numel(data.trial)
    data.trial{iTrial} = data.trial{iTrial}(1:330,:);
end

% make the grad info
grad = D.sensors('MEG');
data.grad = grad;

% make data double
data.trial{1} = double(data.trial{1});

if ~isempty(badchans)
    
    % repair the bad channels, for plotting
    badch = find(badchans);
    badlabels = cell(numel(badch),1);
    
    for i = 1:numel(badlabels)
        badlabels{i} = data.label{badch(i)};
    end
    
    cfg = [];
    cfg.badchannel = badlabels;
    
    cfg_nei = [];
    cfg_nei.method = 'triangulation';
    % cfg.neighbourdist = 0.4;
    cfg_nei.layout = [osldir '/layouts/neuromag306all.lay'];
    neighbours = ft_prepare_neighbours(cfg_nei);
    
    cfg.neighbours = neighbours;
    
    data = ft_channelrepair(cfg,data);
    
end


disp('Doing std');
data.powspctrm = std(data.trial{1},[],2);
data.powspctrm(307:end) = 1;

if dolog
    disp('Doing log')
    data.powspctrm = log(data.powspctrm);
end

data.freq = 10;
data.time = 1;
data.dimord = 'chan_freq_time';

cfg = [];
data = ft_combineplanar(cfg,data);

cfg = [];
cfg.baseline = 'no';
cfg.colorbar = 'yes';
cfg.xlim         = [1 1];
cfg.ylim         = [10 10];

if magGrad
    cfg.layout      = [osldir '/layouts/neuromag306cmb.lay'];
else
    cfg.layout      = [osldir '/layouts/neuromag306mag.lay'];
end

% repairing the bad channels doesn't seem to work...
% ...so get rid of the ones that have gone NaN-y
badinds  = isnan(data.powspctrm);
badinds  = badinds(1:102);
goodinds = ones(102,1);
goodinds(badinds) = 0;
chans2use = data.label(find(goodinds));

cfg.channel = chans2use;
ft_topoplotTFR(cfg,data);
