#!/bin/bash

s=${SGE_TASK}
i="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/$s"
mkdir $i/SyNQuick/T1
antsRegistrationSyNQuick.sh \
	-d 3 \
	-f $i/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz \
	-m $i/extraction/OutputBrainExtractionBrain.nii.gz \
	-t a \
	-o $i/SyNQuick/T1/SyNQuick

 
