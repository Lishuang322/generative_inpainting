#!/bin/bash
#directory of dataset
dir="/data/data-hulishuang/img-dataset/oxford_smeared/white/t85_p400"
picture=$dir/"picture"
mask_dir=$dir/"mask"
for file in $picture/*
do
    #delete the prefix(path) get image name 
    img=${file##*/}
    #get the corresponding absolute path of mask
    mask=${mask_dir}/$img
    checkpoint_d="/data/data-hulishuang/project-data/generative_inpainting/release_places2_256"
    output_dir="/data/data-hulishuang/img-dataset/oxford_smeared/inpaint/t85_p400_places"
    if [ ! -d $output_dir ]
    then
        mkdir $output_dir
    fi
    output_image=$output_dir/${img}
    
    python test.py --image $file --mask $mask --output $output_image --checkpoint_dir $checkpoint_d
done

#change dir, checkpoint_d, output_dir before running

