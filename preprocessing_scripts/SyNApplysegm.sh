#!/bin/bash

source /usr/local/anaconda3/etc/profile.d/conda.sh
conda activate nistuff
unset PYTHONPATH

subs=(A007_t3 A008_t3 A009_t3 A013_t2 A016_t1 C103_t2 C106_t1 C107_t1 C109_t1)

for s in ${subs[@]}
do :

	i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s"
	j="$i/anatomy/segmentation/"
        path="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/"

        rm /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch//$s/anatomy/segmentation/${s}_csf_bin.gz.nii.gz
        fslmaths /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch//$s/anatomy/segmentation/seg2BrainSegmentationPosteriors1.nii.gz -thr 0.1 /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch//$s/anatomy/segmentation/${s}_csf_bin

        fslmaths /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch//$s/anatomy/segmentation/${s}_csf_bin.nii.gz -bin /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch//$s/anatomy/segmentation/${s}_csf_bin

	ImageMath 3 $j/${s}_csf_neg.nii.gz Neg /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch//$s/anatomy/segmentation/${s}_csf_bin.nii.gz

        python /home/despoC/ioannis/Berkeley_research1/stroke/scripts2/aux_scripts/make_reference_for_norm.py /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch//$s/anatomy/segmentation/${s}_csf_neg.nii.gz $path/${s}/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch//$s/anatomy/segmentation/${s}_csf_neg_ref.nii.gz

        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_csf_neg_ref.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_csf_neg_in_perf_space.nii.gz 

        


done


	

		
		
		
	
