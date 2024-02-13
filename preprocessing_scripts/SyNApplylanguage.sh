#!/bin/bash
#source /home/despoB/dlurie/.bashrc

subs=(A007_t3 A008_t3 A009_t3 A013_t2 A016_t1 C103_t2 C106_t1 C107_t1 C109_t1)
for s in ${subs[@]}
do :
        # frontal 
        rm $j/${s}_frontalpole_in_perf_space_r.nii.gz
	i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s"
	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_smallerfrontal_thr20_right_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_frontal_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_frontal_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_frontal_in_perf_space_r.nii.gz 

        # temporal 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_smallertemporal_thr20_right_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_temporal_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_temporal_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_temporal_in_perf_space_r.nii.gz  


        # occipital 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_OccipitalPole_thr20_right_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_occipital_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_occipital_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_occipital_in_perf_space_r.nii.gz 

        # central 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_Central_thr20_right_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_central_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_central_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_central_in_perf_space_r.nii.gz 

        # frontal pole 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_FrontalPole_thr20_right_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_frontalpole_in_T1_space.nii.gz 

        # ^remember to fix this again for the temporal ones
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_frontalpole_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_frontalpole_in_perf_space_r.nii.gz  


         # mtg 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_MTG_tempoccip_thr20_left_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_mtg_in_T1_space.nii.gz 

        # 
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_mtg_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_mtg_in_perf_space.nii.gz  


         # mtg 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_MTG_tempoccip_thr20_right_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_mtg_in_T1_space.nii.gz 

        # 
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_mtg_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_mtg_in_perf_space_r.nii.gz  


         # parietal 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_Parietal_thr20_right_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_parietal_in_T1_space.nii.gz 

        # 
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_parietal_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_parietal_in_perf_space_r.nii.gz  

        # sfg 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_SFG_thr20_right_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_sfg_in_T1_space.nii.gz 

        # 
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_sfg_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_sfg_in_perf_space_r.nii.gz



        # temporal anterior 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_TemporalAnterior_thr20_right_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_temporal_ant_in_T1_space.nii.gz 

        # 
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_temporal_ant_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_temporal_ant_in_perf_space_r.nii.gz 

         # temporal pole 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_new/HO_TemporalPole_thr20_right_bin.nii \
		-r $i/extraction/OutputBrainExtractionBrain.nii.gz -t $i/SyN/${s}_MNItoT1_0GenericAffine.mat -t $i/SyN/${s}_MNItoT1_1Warp.nii.gz \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_temporal_pole_in_T1_space.nii.gz 

        
        antsApplyTransforms \
		-d 3 \
		-i $j/${s}_temporal_pole_in_T1_space.nii.gz  \
		-r $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
		-t $i/SyNQuick/T1/SyNQuick0GenericAffine.mat \
                -n NearestNeighbor \
		--float \
		-v \
		-o $j/${s}_temporal_pole_in_perf_space_r.nii.gz 
        #########
        rm $j/${s}_fluenc_in_perf_space_r.nii.gz
        rm $j/${s}_audword_in_perf_space_r.nii.gz
        rm $j/${s}_reper_in_perf_space.nii.gz
        rm $j/${s}_reper_in_perf_space_r.nii.gz

        # VLSM repet 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_VLSM/Repetition_t_thresh.nii \
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
		-o $j/${s}_repet_in_perf_space.nii.gz  


        # VLSM audword 
        
 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_VLSM/AudWordRecog_t_thresh.nii \
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
		-o $j/${s}_audword_in_perf_space.nii.gz   

       # VLSM fluenc 

	j="$i/masks"

	antsApplyTransforms \
		-d 3 \
		-i /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_VA/masks_VLSM/Fluency_t_thresh.nii \
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
		-o $j/${s}_fluenc_in_perf_space.nii.gz    
    
done

