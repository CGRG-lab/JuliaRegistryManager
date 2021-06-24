using LocalRegistry

# `package_name_or_path` can be specified in the following ways:
# * By package name. The package must be available in the active `Pkg`
#   environment.
# * By path. This is distinguished from package name by having more than
#   one path component. A path in the current working directory can be
#   specified by starting with `"./"`.
# * By module. It needs to first be loaded by `using` or `import`.
package_name_or_path = ARGS[1]

# `registry_name_or_path` can be specified by name or by path in the same way as
# `package`. If omitted or `nothing`, it will be automatically located
# by `package`.
try
    global registry_name_or_path = ARGS[2]
catch 
    global registry_name_or_path = nothing
end

register(package_name_or_path; registry=registry_name_or_path, push=true)