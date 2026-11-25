<h1 align="center">app-skullStrip</h1>

<p align="center">
  Skull-strips a T1-weighted image with AFNI 3dSkullStrip, optionally passing extra 3dSkullStrip options, and outputs the brain-extracted T1w.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.565"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.565-blue.svg" alt="Run on brainlife.io"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Skull-strips a T1-weighted image with AFNI 3dSkullStrip, optionally passing extra 3dSkullStrip options, and outputs the brain-extracted T1w.**

Runs AFNI 3dSkullStrip on the input T1w NIfTI (with a virtual X display) and writes the result as t1.nii.gz. Extra command-line options can be given verbatim in optional_params. Use it as a simple brain-extraction step; check the result visually, as the README notes the skull may not be fully removed.

| | |
|---|---|
| **Inputs** | `neuro/anat/t1w` |
| **Outputs** | `neuro/anat/t1w` |
| **Container** | `vnbcs/afni_for_bl:1.2` |
| **Resources** | 1 GB memory · 0.25 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.565](https://doi.org/10.25663/brainlife.app.565) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `nifti_input` | `neuro/anat/t1w` | yes | T1W in NIfTI format |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/anat/t1w` | skull-stripped t1w |

<details>
<summary><b>Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `optional_params` | string | `null` | add all optional parameters here, in the format below: -parameter option -parameter2 if no optional parameters needed, leave empty. for a full list of optional parameters and what they do, see AFNI's documentation: https://afni.nimh.nih.gov/pub/dist/doc/program_help/3dSkullStrip.html examples: -ld 30 -no_spatnorm -niter 750 -ld 50 -monkey -spatnorm_dxyz |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.565](https://doi.org/10.25663/brainlife.app.565), choose `neuro/anat/t1w` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/anat/t1w`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `vnbcs/afni_for_bl:1.2`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "t1": "/path/to/nifti_input/t1",
       "optional_params": "null"
   }
   ```

3. Run `./main`.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- app-skullStrip. brainlife.io App. [doi:10.25663/brainlife.app.565](https://doi.org/10.25663/brainlife.app.565)
- Cox. AFNI: Software for Analysis and Visualization of Functional Magnetic Resonance Neuroimages. *Computers and Biomedical Research* 29:162-173 (1996). [doi:10.1006/cbmr.1996.0014](https://doi.org/10.1006/cbmr.1996.0014)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

Maintained by [@vnbcs](https://github.com/vnbcs).
