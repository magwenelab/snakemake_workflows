# snakemake_workflows

Useful Snakemake workflows related to bioinformatics work in the Magwene lab.


### Basic setup

* Create a directory for your analysis `~/my_analysis`

* Create a subdirectory for config files: `~/my_analysis/config`

    * Copy an appropriate `config.yaml` for the workflow you want to run to `~/my_analysis/config`; edit any parameters as necessary

    * Note that for multi-tool workflows you simply add appropriate YAML blocks for each tool

    * Each workflow also typically takes a CSV formatted table named as `toolname_table.csv` (e.g. `fastp_table.csv`) that lists the samples analyzed and where the files used in the analysis can be found. The required format for these tables is specified in the workflow README documents (e.g. `README_fastp.md`).  For small inputs these can be created by hand, but when dealing with hundreds of samples these are best created using bash (or other) scripts. 

        - In multitool workflows, the output of one workflow may be the input into another workflow

* Copy  one of the example "driver" snakefiles from `snakesfiles/` to `~/my_analysis/Snakefile` (the `Snakefile` found in each tool subdirectory is local to that tool and should not be modified)

* Run the snakefile (e.g. `snakemake -c 24 --use-conda`) for the top-level directory (`~/my_analysis`).

* Results will be written to `~/my_analysis/results`, with an appropriate sub-directory per tool (e.g. `~/my_analysis/fastp`) and each samples results typically written to a sample specific directory (e.g. `~/my_analysis/fastp/PMY1234/`)

* When appropriate, a directory with soft-links to the key results files is also typically created for each tool (e.g. `~/my_analysis/fastp/softlinked`).  This facilitates access all the key result files from one directory, and is useful when the output of one tool is the input into the next tool