def get_conda_environment(wildcards):
    simulation = wildcards.simulation
    return f"../envs/{simulation}.yaml"
