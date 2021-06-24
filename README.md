# JuliaRegistryManager

Simple script that wraps `LocalRegistry.jl` to manage the julia registry.

## Install LocalRegistry
In the julia REPL environment, use the following command to install LocalRegistry.
```
] st
add LocalRegistry@0.4.0
```
> :sweat_smile: I think it is a good choice to install LocalRegistry in the @v#.# julia environment.

## Create registry
In the julia REPL environment, use the following command to create a registry.
```julia
using LocalRegistry
create_registry(registry_name_or_path, registry_repo_url, description="My private registry")
```

Or use the following command to create a registry in the shell.
```shell
julia create_registry.jl registry_name_or_path registry_repo_url "My private registry"
```

> :warning: Remember to replace `registry_name_or_path` and `registry_repository_url`, and description of registry. \
> :information_source: For `registry_name_or_path`, if a name is given, it is created in the standard registry location; if a path is given, the last path component is used as the name of the registry.


## Add registry
In the julia REPL environment, use the following command to add the registry.
```julia
] st
registry add registry_repository_url
```

> :warning: Remember to replace `registry_repository_url`. \
> :information_source: This only needs to be done once per Julia installation.

## Manually register the package
Change the current working directory to the directory where `README.md` exists.

In the julia REPL environment, use the following command to register the package.
```julia
using LocalRegistry
register(package_name_or_path, registry=registry_name_or_path)
```

Or use the following command to register the package in the shell.
```shell
julia register.jl package_name_or_path registry_name_or_path
```
> :warning: Make sure you have push permission to the registry repository. \
> :warning: Remember to replace `package_name_or_path` and `registry_name_or_path` \
> :information_source: For `package_name_or_path`, if a name is given, the package must be available in the active `Pkg` environment.

## Add pre-push to automatically register the package before pushing

Copy `git-hooks/pre-push` to the `.git/hooks/` folder in the package repository. And modify the `registry_name_or_path` variable in `pre-push`.

> :warning: Make sure you have push permission to the registry repository. \
> :warning: Remember to replace `registry_name_or_path` in pre-push file. \
> :information_source: This only needs to be done once per package repository.

## References
- https://discourse.julialang.org/t/creating-a-registry/12094
- https://github.com/GunnarFarneback/LocalRegistry.jl
- https://github.com/HolyLab/HolyLabRegistry
- https://github.com/crstnbr/TrebstRegistry