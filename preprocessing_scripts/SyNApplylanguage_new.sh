#!/bin/bash
#source /home/despoB/dlurie/.bashrc

subs=(A007_t3 A008_t3 A009_t3 A013_t2 A016_t1 C103_t2 C106_t1 C107_t1 C109_t1)

#HO_AngularGyrus_thr20_right_bin.nii.gz
#HO_Central_thr20_right_bin.nii
#HO_FrontalPole_thr20_right_bin.nii
#HO_IFGopercularis_thr20_right_bin.nii.gz
#HO_IFGtriangular_thr20_right_bin.nii.gz
#HO_MTG_anterior_thr20_right_bin.nii.gz
#HO_MTG_posterior_thr20_right_bin.nii.gz
#HO_MTG_tempoccip_thr20_right_bin.nii
#HO_OccipitalPole_thr20_right_bin.nii
#HO_SFG_thr20_right_bin.nii
#HO_STG_anterior_thr20_right_bin.nii.gz
#HO_STG_posterior_thr20_right_bin.nii.gz
#HO_SupraG_anterior_thr20_right_bin.nii.gz
#HO_SupraG_posterior_thr20_right_bin.nii.gz
#HO_TemporalPole_thr20_right_bin.nii

for s in ${subs[@]}
do :
       

         
        i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s"
	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_AngularGyrus_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_AngularGyrus_thr20_right_in_perf_space.nii.gz  


     

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_Central_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_Central_thr20_right_in_perf_space.nii.gz  

	

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_FrontalPole_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_FrontalPole_thr20_right_in_perf_space.nii.gz  

	

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_IFGopercularis_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_IFGopercularis_thr20_right_in_perf_space.nii.gz 


	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_IFGtriangular_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_IFGtriangular_thr20_right_in_perf_space.nii.gz 

	

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_MTG_anterior_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_MTG_anterior_thr20_right_in_perf_space.nii.gz 

	

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_MTG_posterior_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_MTG_posterior_thr20_right_in_perf_space.nii.gz 



	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_MTG_posterior_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_MTG_posterior_thr20_right_in_perf_space.nii.gz 

	

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_MTG_tempoccip_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_MTG_tempoccip_thr20_right_in_perf_space.nii.gz 

	

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_OccipitalPole_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_OccipitalPole_thr20_right_in_perf_space.nii.gz 

	
	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_SFG_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_SFG_thr20_right_in_perf_space.nii.gz 

       

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_STG_anterior_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_STG_anterior_thr20_right_in_perf_space.nii.gz 



	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_STG_posterior_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_STG_posterior_thr20_right_in_perf_space.nii.gz 

        

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_SupraG_anterior_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_SupraG_anterior_thr20_right_in_perf_space.nii.gz 

	   

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_SupraG_posterior_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_SupraG_posterior_thr20_right_in_perf_space.nii.gz 

	  

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_language_new/HO_smallROIs_RH/HO_TemporalPole_thr20_right_bin.nii.gz \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_H0_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_H0_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_HO_TemporalPole_thr20_right_in_perf_space.nii.gz 
    
done

