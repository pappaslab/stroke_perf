#!/bin/bash
source /home/despo/dlurie/.bashrc



i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/${SGE_TASK}"

cd $i/extraction 
anat=$i/anatomy/T1.nii
mask=/home/despoC/ioannis/Berkeley_research1/stroke/scripts2/ants_play_data/IXI/T_template_BrainCerebellumProbabilityMask.nii.gz
temp=/home/despoC/ioannis/Berkeley_research1/stroke/scripts2/ants_play_data/IXI/T_template2.nii.gz
out=$i/extraction 	

antsBrainExtraction.sh \
	-d 3 \
	-a ${anat} \
	-m ${mask} \
	-e ${temp} \
	-o Output

