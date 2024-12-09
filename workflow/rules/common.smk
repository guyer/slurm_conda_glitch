def get_conda_environment(wildcards):
    path = checkpoints.render_conda_template.get(**wildcards).output[0]
    # https://snakemake.readthedocs.io/en/stable/project_info/faq.html#how-does-snakemake-interpret-relative-paths
    # "... output ... files are considered to be relative
    # to the working directory ...
    # Any other directives (e.g. conda:, ...) consider paths to be
    # relative to the Snakefile they are defined in."
    return os.path.join("..",
                        os.path.relpath(path, start="workflow/"))
