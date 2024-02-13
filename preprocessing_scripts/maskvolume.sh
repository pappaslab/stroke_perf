#!/bin/bash

source /usr/local/anaconda3/etc/profile.d/conda.sh
conda activate nistuff
unset PYTHONPATH

subs=(A007_t3 A008_t3 A009_t3 A013_t2 A016_t1 C103_t2 C106_t1 C107_t1 C109_t1)
for s in ${subs[@]}
do :

	i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s"
	j="$i/masks"
        path="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/"

	
        echo $i
        fslstats $i/masks/Lesion.nii -V

        


done


	

		
		
		
	
