rule conda_info:
    output:
        "results/{simulation}.txt"
    conda:
        get_conda_environment
    notebook:
        "../notebooks/conda_info.py.ipynb"

checkpoint render_conda_template:
    output:
        "workflow/envs/{simulation}.yaml"
    input:
        template="workflow/envs/template.yaml"
    template_engine:
        "yte"
