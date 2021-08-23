# trying to make AFNI not whine about lack of display
DISPLAY=localhost:0.0

# load filename and optional parameters
t1=`jq -r '.t1' config.json`
optional_params=`jq -r '.optional_params' config.json`

# following creates an output filename w a suffix
# rather than AFNI's default prefix
t1_fn=$(echo $t1 | cut -d "." -f 1 | rev | cut -d "/" -f 1 | rev)
output_fn=${t1_fn}_ss.nii.gz

# create new directory skullStrip for t1w file and output
mkdir skullStrip

# move file to new directory skullStrip
if [ -f ./skullStrip/t1.nii.gz ];
then
  echo "file exists. skipping copying"
else
  cp -v ${t1} ./skullStrip/t1.nii.gz;
fi

# run 3dSkullStrip
if [ "$optional_params" != "null" ]; then
    # 3dSkullStrip -input ./skullStrip/t1.nii.gz -prefix anat_ss ${optional_params}
    3dSkullStrip -input ./skullStrip/t1.nii.gz -prefix ${output_fn} ${optional_params}
else
    # 3dSkullStrip -input ./skullStrip/t1.nii.gz -prefix anat_ss
    3dSkullStrip -input ./skullStrip/t1.nii.gz -prefix ${output_fn}
fi
