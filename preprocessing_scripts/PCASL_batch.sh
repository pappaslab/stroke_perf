#!/bin/bash
source /usr/local/anaconda3/etc/profile.d/conda.sh
conda activate nistuff
unset PYTHONPATH

# list of subjects 

subs=(A007_t3 A009_t3 A013_t2 A016_t1 C106_t1 C109_t1)
#A008_t3 - 4 shot sequence, but longer TR, TR = 6.4\
#C103_t2 - 4 shot sequence, but longer TR, TR = 8.9173\
#C107_t1 - 4 shot sequence, but longer TR, TR = 4.8281
for s in "${subs[@]}"
do
	:

	path="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/"
	cd $path/$s/perfusion
	# make the output directory
	#mkdir $path/$s/${s}_oxasl_tc

        # fslroi ${s}_PCASL.nii.gz M0.nii.gz 1 1
        fslroi M0.nii split_ 0 1
        bet split_.nii.gz split_bet
        fslmaths split_bet.nii.gz -bin split_bet_bin.nii.gz 

         
        mcflirt -in PCASL.nii -plots
        # oxford_asl -i ${s}_PCASL_mcf.nii.gz --ibf=rpt --iaf=tc --tis 2.97 --bolus 1.470 --casl --tr 4 -c M0.nii.gz --cgain 1 --cmethod voxel --wp --t1b 1.65 --alpha 0.68 --fixbolus --artoff -o $path/sub${s}/ASL_Output --spatial

        fslmaths PCASL_mcf.nii.gz -mul split_bet_bin.nii.gz PCASL_mcf_fix

        oxford_asl -i PCASL_mcf_fix.nii.gz --ibf=rpt --iaf=tc --tis 3.80 --bolus 1.80 --casl \
                                -c split_.nii.gz --tr 4.6 --cgain 10.00 --cmethod voxel \
                                --wp --t1b 1.65 --alpha 0.72 --fixbolus --spatial --mc --artoff \
                                -o $path/${s}/ASL_Output
	

        python /home/despoC/ioannis/Berkeley_research1/stroke/scripts2/perfusion/Stephanie_scripts/Maria_protocol_long/nb_reorient.py \
		$path/${s}/ASL_Output/native_space/perfusion_calib.nii.gz \
		$path/${s}/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz 

done
###
subs=(C103_t2)
for s in "${subs[@]}"
do
	:

	path="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/"
	cd $path/$s/perfusion
	# make the output directory
	#mkdir $path/$s/${s}_oxasl_tc

        # fslroi ${s}_PCASL.nii.gz M0.nii.gz 1 1
        fslroi M0.nii split_ 0 1
        bet split_.nii.gz split_bet
        fslmaths split_bet.nii.gz -bin split_bet_bin.nii.gz 

         
        mcflirt -in PCASL.nii -plots
        # oxford_asl -i ${s}_PCASL_mcf.nii.gz --ibf=rpt --iaf=tc --tis 2.97 --bolus 1.470 --casl --tr 4 -c M0.nii.gz --cgain 1 --cmethod voxel --wp --t1b 1.65 --alpha 0.68 --fixbolus --artoff -o $path/sub${s}/ASL_Output --spatial

        fslmaths PCASL_mcf.nii.gz -mul split_bet_bin.nii.gz PCASL_mcf_fix

        oxford_asl -i PCASL_mcf_fix.nii.gz --ibf=rpt --iaf=tc --tis 3.80 --bolus 1.80 --casl \
                                -c split_.nii.gz --tr 8.9 --cgain 10.00 --cmethod voxel \
                                --wp --t1b 1.65 --alpha 0.72 --fixbolus --spatial --mc --artoff \
                                -o $path/${s}/ASL_Output
	

        python /home/despoC/ioannis/Berkeley_research1/stroke/scripts2/perfusion/Stephanie_scripts/Maria_protocol_long/nb_reorient.py \
		$path/${s}/ASL_Output/native_space/perfusion_calib.nii.gz \
		$path/${s}/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz 

done
###
subs=(A008_t3)
for s in "${subs[@]}"
do
	:

	path="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/"
	cd $path/$s/perfusion
	# make the output directory
	#mkdir $path/$s/${s}_oxasl_tc

        # fslroi ${s}_PCASL.nii.gz M0.nii.gz 1 1
        fslroi M0.nii split_ 0 1
        bet split_.nii.gz split_bet
        fslmaths split_bet.nii.gz -bin split_bet_bin.nii.gz 

         
        mcflirt -in PCASL.nii -plots
        # oxford_asl -i ${s}_PCASL_mcf.nii.gz --ibf=rpt --iaf=tc --tis 2.97 --bolus 1.470 --casl --tr 4 -c M0.nii.gz --cgain 1 --cmethod voxel --wp --t1b 1.65 --alpha 0.68 --fixbolus --artoff -o $path/sub${s}/ASL_Output --spatial


        fslmaths PCASL_mcf.nii.gz -mul split_bet_bin.nii.gz PCASL_mcf_fix

        oxford_asl -i PCASL_mcf_fix.nii.gz --ibf=rpt --iaf=tc --tis 3.80 --bolus 1.80 --casl \
                                -c split_.nii.gz --tr 6.4 --cgain 10.00 --cmethod voxel \
                                --wp --t1b 1.65 --alpha 0.72 --fixbolus --spatial --mc --artoff \
                                -o $path/${s}/ASL_Output
	

        python /home/despoC/ioannis/Berkeley_research1/stroke/scripts2/perfusion/Stephanie_scripts/Maria_protocol_long/nb_reorient.py \
		$path/${s}/ASL_Output/native_space/perfusion_calib.nii.gz \
		$path/${s}/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz 

done
###
subs=(C107_t1)
for s in "${subs[@]}"
do
	:

	path="/home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch/"
	cd $path/$s/perfusion
	# make the output directory
	#mkdir $path/$s/${s}_oxasl_tc

        # fslroi ${s}_PCASL.nii.gz M0.nii.gz 1 1

        fslroi M0.nii split_ 0 1
        bet split_.nii.gz split_bet
        fslmaths split_bet.nii.gz -bin split_bet_bin.nii.gz 
       


        mcflirt -in PCASL.nii -plots
        # oxford_asl -i ${s}_PCASL_mcf.nii.gz --ibf=rpt --iaf=tc --tis 2.97 --bolus 1.470 --casl --tr 4 -c M0.nii.gz --cgain 1 --cmethod voxel --wp --t1b 1.65 --alpha 0.68 --fixbolus --artoff -o $path/sub${s}/ASL_Output --spatial

        fslmaths PCASL_mcf.nii.gz -mul split_bet_bin.nii.gz PCASL_mcf_fix

        oxford_asl -i PCASL_mcf_fix.nii.gz --ibf=rpt --iaf=tc --tis 3.80 --bolus 1.80 --casl \
                                -c split_.nii.gz --tr 4.8 --cgain 10.00 --cmethod voxel \
                                --wp --t1b 1.65 --alpha 0.72 --fixbolus --spatial --mc --artoff \
                                -o $path/${s}/ASL_Output
	

        python /home/despoC/ioannis/Berkeley_research1/stroke/scripts2/perfusion/Stephanie_scripts/Maria_protocol_long/nb_reorient.py \
		$path/${s}/ASL_Output/native_space/perfusion_calib.nii.gz \
		$path/${s}/ASL_Output/native_space/reoriented_perfusion_calib.nii.gz 

done

