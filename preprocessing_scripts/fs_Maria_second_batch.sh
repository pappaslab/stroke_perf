#!/bin/bash
#source /home/despoB/dlurie/.bashrc

subs=(A007_t3 A013_t2 C106_t1 A008_t3 A016_t1 C107_t1 A009_t3 C103_t2 C109_t1) 

for s in ${subs[@]}
do :


        i="/home/despoC/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s"
	j="$i/anatomy"
	cd ${j}
        #lesion_filling -i ${j}/T1.nii -o ${s}_patched_t1.nii.gz -w ${i}/extraction/OutputBrainExtractionMask.nii.gz -l ${i}/masks/Lesion.nii
        #${s}_t1mprage.nii.gz

        #fslmaths ${j}/segmentation/seg2BrainSegmentationPosteriors3.nii.gz -add ${i}/masks/Lesion.nii fixed_lesion.nii.gz
        #fslmaths fixed_lesion.nii.gz -bin fixed_lesion_bin.nii.gz
        #fslmaths fixed_lesion_bin.nii.gz -kernel sphere 5 -dilD fixed_lesion_bin_5.nii.gz
        #lesion_filling -i ${j}/T1.nii -o ${s}_patched_t1.nii.gz -w fixed_lesion_bin_5.nii.gz -l ${i}/masks/Lesion.nii
        
        cd /home/despo/ioannis/Berkeley_research1/stroke/scripts2/perfusion/Stephanie_scripts/fs_scripts
        t1=${j}/eT1.nii
        echo -e "#!/bin/bash\nsource /home/despo/ioannis/.bashrc\nrecon-all -s sb_Maria_stroke_sub-${s} -i ${t1} -all" > script_${s}.sh
				


	qsub script_${s}.sh
done
