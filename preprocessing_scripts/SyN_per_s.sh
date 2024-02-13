#!/bin/bash

s=${SGE_TASK}
i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s"

antsRegistrationSyN.sh \
	-d 3 \
	-f $i/extraction/OutputBrainExtractionBrain.nii.gz \
	-m /home/despoC/ioannis/Imaging_general/MNI_templates/MNI152_T1_1mm_Brain.nii.gz \
	-x $i/masks/${s}_lesionMaskNeg.nii.gz \
	-o $i/SyN/${s}_MNItoT1_

 

