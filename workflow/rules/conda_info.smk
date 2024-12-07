rule conda_info:
    output:
        "results/{simulation}.txt"
    conda:
        get_conda_environment
    notebook:
        "../notebooks/conda_info.py.ipynb"
