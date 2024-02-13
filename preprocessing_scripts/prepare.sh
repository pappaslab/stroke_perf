#!/bin/bash
# do these first
#mkdir anatomy  
#mkdir ASL_Output  
#mkdir extraction  
#mkdir masks  
#mkdir perfusion  
#mkdir SyN  
#mkdir SyNQuick
#mv SPIRAL_* perfusion
#mv T1* anatomy
#mv gre* anatomy
#mv Lesion* masks


subs=(A007_t3 A008_t3 A009_t3 A013_t2 A016_t1 C103_t2 C106_t1 C107_t1 C109_t1)

for s in ${subs[@]}
do :

	cd /home/despo/ioannis/Berkeley_research1/stroke/data/perfusion_Maria/Perfusion_data/second_batch/perfusion_second_batch

	cd ${s}/perfusion
	mv *ASL* PCASL.nii
	mv *M0* M0.nii
	
	cd ..
	pwd
	cd anatomy
	mv *T1* T1.nii
	cd ..
	cd masks
	mv *Lesion* Lesion.nii
	cd ..

done

