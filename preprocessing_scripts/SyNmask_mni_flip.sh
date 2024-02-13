#!/bin/bash
#source /home/despoB/dlurie/.bashrc

subs=(A007_t3 A008_t3 A009_t3 A013_t2 A016_t1 C103_t2 C106_t1 C107_t1 C109_t1)
for s in ${subs[@]}
do :
        # frontal 
        
	i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch//$s"
	j="$i/masks"

	
	antsApplyTransforms \
		-d 3 \
		-i $j/Lesion.nii \
		-r /home/despo/ioannis/Imaging_general/MNI_templates/MNI152_T1_1mm_Brain.nii.gz -t [$i/SyN/${s}_MNItoT1_0GenericAffine.mat,1] -t $i/SyN/${s}_MNItoT1_1InverseWarp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_lesion_in_MNI_space.nii.gz 


        fslswapdim $j/${s}_lesion_in_MNI_space.nii.gz  -x y z $j/${s}_lesion_in_MNI_space_flip


        antsApplyTransforms \
		-d 3 \
		-i -i $j/${s}_lesion_in_MNI_space_flip.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_lesion_flip_in_T1_space.nii.gz 


        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_lesion_flip_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_lesion_flip_in_perf_space.nii.gz 

done
