$isodate = Get-Date -Format FileDateUniversal
$targets = "os", "core", "data_science", "project"
foreach ($target in $targets) {
    docker build --pull `
        --tag loco/${target}:${isodate} `
        --tag loco/${target}:latest `
        --tag matthewbegun/loco:${target} `
        --target ${target} `
        .devcontainer
}
docker tag matthewbegun/loco:project matthewbegun/loco:latest
docker tag matthewbegun/loco:project matthewbegun/loco:${isodate}
