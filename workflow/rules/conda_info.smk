rule conda_info:
    output:
        "results/{simulation}.txt"
    input:
        "workflow/envs/{simulation}.yaml",
        "config/all_environments.csv"
    conda:
        get_conda_environment
    notebook:
        "../notebooks/conda_info.py.ipynb"

checkpoint aggregate_environments:
    localrule: True
    output:
        "config/all_environments.csv"
    input:
        expand("workflow/envs/{simulation}.yaml",
               simulation=SIMULATIONS)
    run:
        import csv
        import os
        with open(output[0], 'w', newline='') as csvfile:
            envwriter = csv.writer(csvfile)
            for env in input:
                head, tail = os.path.split(env)
                root, ext = os.path.splitext(tail)
                # https://snakemake.readthedocs.io/en/stable/project_info/faq.html#how-does-snakemake-interpret-relative-paths
                # "... output ... files are considered to be relative
                # to the working directory ...
                # Any other directives (e.g. conda:, ...) consider paths to be
                # relative to the Snakefile they are defined in."
                relenv = os.path.join("..",
                                      os.path.relpath(env, start="workflow/"))

                envwriter.writerow([root, relenv])

checkpoint render_conda_template:
    output:
        "workflow/envs/{simulation}.yaml"
    input:
        template="workflow/envs/template.yaml"
    template_engine:
        "yte"
