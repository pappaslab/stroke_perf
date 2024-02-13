#!/bin/bash


subs=(A007_t3 A008_t3 A009_t3 A013_t2 A016_t1 C103_t2 C106_t1 C107_t1 C109_t1)
for s in ${subs[@]}
do :
       

        # Naming 
        i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s"
	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_VLSM_new/Naming_Tnu125_ROI.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_naming_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_naming_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_naming_new_in_perf_space.nii.gz  


        # VLSM audword 
        
 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_VLSM_new/AudComp_Tmax_ROI.nii.gz  \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_audword_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_audword_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_audword_new_in_perf_space.nii.gz   

       # VLSM fluenc 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_VLSM_new/Fluency_Tmax_ROI.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_fluenc_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_fluenc_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_fluenc_new_in_perf_space.nii.gz 

        # VLSM repet 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_VLSM_new/Repetition_Tmax_ROI.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_repet_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_repet_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_repet_new_in_perf_space.nii.gz     
    
done

