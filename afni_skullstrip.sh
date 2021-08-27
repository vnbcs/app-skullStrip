# trying to make AFNI not whine about lack of display
#DISPLAY=localhost:0.0

Xvfb :88 &
export DISPLAY=:88
#Xvfb :88 -screen 0 1024x768x24 >& /dev/null &
#setenv DISPLAY :88
#unsetenv DISPLAY
#killall Xvfb

# load filename and optional parameters
t1=`jq -r '.t1' config.json`
optional_params=`jq -r '.optional_params' config.json`

# following creates an output filename w a suffix
# rather than AFNI's default prefix
t1_fn=$(echo $t1 | cut -d "." -f 1 | rev | cut -d "/" -f 1 | rev)
output_fn=${t1_fn}_ss.nii.gz

# create new directory skullStrip for t1w file and output
mkdir -p skullStrip

# move file to new directory skullStrip
install $t1 skullStrip/t1.nii.gz

# run 3dSkullStrip
if [ "$optional_params" != "null" ]; then
    3dSkullStrip -input ./skullStrip/t1.nii.gz -prefix ${output_fn} ${optional_params}
else
    3dSkullStrip -input ./skullStrip/t1.nii.gz -prefix ${output_fn}
fi
