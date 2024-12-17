def get_conda_environment(wildcards):
    import csv
    path = checkpoints.aggregate_environments.get().output[0]
    with open(path) as csvfile:
        envfile = csv.reader(csvfile)
        for simulation, env in envfile:
            if simulation == wildcards.simulation:
                return env
    return None
