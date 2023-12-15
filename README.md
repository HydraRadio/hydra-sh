# hydra-sh
Spherical harmonic sampler for Hydra

All actual parameters are set in the python script directly / hard 
coded (sorry Phil!) 

Remember to update all paths.  

COMMAND LINE ARGS:
-dir (or --directory) sets the output directory for the precomputation 
and results ONLY, the slurm output (which will tell you when 
precomputation is done, any errors and if it succeeds also writes what 
your output folder is to easier link the two)

-data_seed (or --data_seed) sets the random seed for the precomputation 
part, i.e. also the noise on the data.

-jobid (or --jobid) parsed the array-job id to the script, the radnom 
seed for the specific sample is set by 100 * jobid + sample_number

OUTPUT:
The data is saved in .npz files as results_{data_seed}_{random_seed}.npz 
where random_seed refers to the specific samples random seed 

The precomputations are saved last because all the times for the run are 
saved in this file too. The precomputation is saved as 
precomputation_{data_seed}_{jobid} since one precomputation covers the 
entire job. 


