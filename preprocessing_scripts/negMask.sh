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

	ImageMath 3 $j/${s}_lesionMaskNeg.nii.gz Neg /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s/masks/Lesion.nii

        #fslstats /home/despoC/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/$s/masks/Lesion_${s}_final.nii -V

        python /home/despo/ioannis/Berkeley_research1/stroke/scripts2/aux_scripts/make_reference_for_norm.py /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s/masks/Lesion.nii $path/${s}/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz  /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s/masks/${s}_lesion_r_ref.nii.gz

        python /home/despo/ioannis/Berkeley_research1/stroke/scripts2/aux_scripts/make_reference_for_norm.py $j/${s}_lesionMaskNeg.nii.gz $path/${s}/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz  $j/${s}_lesionMaskNeg_ref.nii.gz

        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_lesionMaskNeg_ref.nii.gz \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_lesionMaskNeg_ref_in_perf_space.nii.gz 


done


	

		
		
		
	
