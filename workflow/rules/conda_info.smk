rule conda_info:
    output:
        "results/{simulation}.txt"
    conda:
        "../envs/{simulation}.yaml"
    notebook:
        "../notebooks/conda_info.py.ipynb"
