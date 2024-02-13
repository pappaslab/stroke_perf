#!/bin/bash
#source /home/despoB/dlurie/.bashrc





s=${SGE_TASK}

i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/${s}"
j="$i/masks"

fslmaths $j/Lesion.nii -kernel sphere 5 -dilD $j/${s}_lesion_dilated_5mm.nii.gz
fslmaths $j/${s}_lesion_dilated_5mm.nii.gz -sub $j/Lesion.nii $j/${s}_perilesional_mask_5mm.nii.gz

fslmaths $j/Lesion.nii -kernel sphere 10 -dilD $j/${s}_lesion_dilated_10mm.nii.gz
fslmaths $j/Lesion.nii -kernel sphere 15 -dilD $j/${s}_lesion_dilated_15mm.nii.gz
fslmaths $j/${s}_lesion_dilated_15mm.nii.gz -sub $j/${s}_lesion_dilated_10mm.nii.gz $j/${s}_perilesional_mask_10-15mm.nii.gz

fslmaths $j/${s}_lesion_dilated_10mm.nii.gz -sub $j/${s}_lesion_dilated_5mm.nii.gz $j/${s}_perilesional_mask_5-10mm.nii.gz



antsApplyTransforms \
	-d 3 \
	-i $j/${s}_perilesional_mask_5mm.nii.gz \
	-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
	-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
        -n NearestNeighbor \
	--float \
	-v \
	-o $j/${s}_perilesional_mask_5mm_in_perf_space.nii.gz 


antsApplyTransforms \
	-d 3 \
	-i $j/${s}_perilesional_mask_10-15mm.nii.gz \
	-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
	-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
        -n NearestNeighbor \
	--float \
	-v \
	-o $j/${s}_perilesional_mask_10-15mm_in_perf_space.nii.gz 


antsApplyTransforms \
	-d 3 \
	-i $j/${s}_perilesional_mask_5-10mm.nii.gz \
	-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
	-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
        -n NearestNeighbor \
	--float \
	-v \
	-o $j/${s}_perilesional_mask_5-10mm_in_perf_space.nii.gz 



	

		
		
		
	
