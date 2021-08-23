# this app runs afni's skullstrip function over a nifti file

# i'm actually not sure if brainlife's docker image for afni contains jq bc i have been testing this locally
# but if it doesn't i will ask them to add it
time singularity exec -e docker://brainlife/afni:16.3.0 ./afni_skullstrip.sh
