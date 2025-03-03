# AtmoRep itwinai plugin

[![GitHub Super-Linter](https://github.com/matbun/atmorep-itwinai-plugin/actions/workflows/lint.yml/badge.svg)](https://github.com/marketplace/actions/super-linter)
[![GitHub Super-Linter](https://github.com/matbun/atmorep-itwinai-plugin/actions/workflows/check-links.yml/badge.svg)](https://github.com/marketplace/actions/markdown-link-check)
[![SQAaaS source code](https://github.com/EOSC-synergy/atmorep-itwinai-plugin.assess.sqaaas/raw/main/.badge/status_shields.svg)](https://sqaaas.eosc-synergy.eu/#/full-assessment/report/https://raw.githubusercontent.com/eosc-synergy/atmorep-itwinai-plugin.assess.sqaaas/main/.report/assessment_output.json)

This repository is an extended version of AtmoRep, originally developed
by the AtmoRep team. This version integrates AtmoRep into the [itwinai](https://github.com/interTwin-eu/itwinai)
framework, enhancing its usability within digital twin applications.

[Original Repository](https://github.com/clessig/atmorep)

![atmorep](img/conceptual.png)

## How to use this plugin

First of all, install the plugin.

> [!NOTE]
> If you run on an HPC system remember to load the correct modules before.
> `activate_env.sh` provides an example for JSC.

```bash
pip install "atmorep-itwinai-plugin @ git+https://github.com/matbun/atmorep-itwinai-plugin"
```

Now you can import the AtmoRep trainer in your code using

```python
from itwinai.plugins.atmorep.trainer import AtmoRepTrainer

my_trainer = AtmoRepTrainer(...)
```

Alternatively, you can launch training using the configuration file in this repository:

```bash
itwinai exec-pipeline --config-name config.yaml

# If you want to dynamically override some fields in the config file
itwinai exec-pipeline --config-name config.yaml \
    epochs=2 \
    training_pipeline.steps.0.config.path_models my_models 
```

> [!NOTE]
> Consider that this model needs to be distributed on 4 GPUs, as it implements
> model-parallel distributed training. It can scale to multiple nodes and
> the SLURM jobs cript `slurm.jsc.sh` provides an example on how to launch
> distributed training on HPC. You can adjust the number of nodes in that file.

## Docker containers

This repository provides two examples of Dockerfiles, one for JupyterLab
images and the other for simple Docker containers. Both Dockerfiles
are based on the itwinai container image, which already provides most
of the dependencies.
