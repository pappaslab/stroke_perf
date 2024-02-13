#!/bin/bash


i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/${SGE_TASK}"
mkdir $i/anatomy/segmentation
antsCorticalThickness.sh \
	-d 3 \
	-a $i/anatomy/T1.nii \
	-e /home/despoC/ioannis/Berkeley_research1/stroke/scripts2/segmentation/T_template2.nii.gz \
	-m /home/despoC/ioannis/Berkeley_research1/stroke/scripts2/segmentation/T_template_BrainCerebellumMask.nii.gz \
	-p /home/despoC/ioannis/Berkeley_research1/stroke/scripts2/segmentation/priors%d.nii.gz \
        -o $i/anatomy/segmentation/seg2

 

