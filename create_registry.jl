# Do this once
using LocalRegistry

# Create a registry with the given `name` or at the local directory
# `path`, and with repository URL `repo`. The first argument is
# interpreted as a path if it has more than one path component and
# otherwise as a name. If a path is given, the last path component is
# used as the name of the registry. If a name is given, it is created in
# the standard registry location. In both cases the registry path must
# not previously exist.
registry_name_or_path = ARGS[1]

# Note that the remote repository should not have any commits
registry_repo_url = ARGS[2]
try
    global description = ARGS[3]
catch 
    global description = nothing
end

create_registry(registry_name_or_path, registry_repo_url; description=description, push=true)
