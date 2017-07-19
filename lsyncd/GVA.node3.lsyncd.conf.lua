settings {
        delay = 2,
        maxProcesses = 3,
        logfile = "/var/log/lsyncd.log",
        insist = true,
        nodaemon = true
}

targetlist = {
"root@192.168.126.88"
}

for _, server in ipairs(targetlist) do
        sync {
        default.rsyncssh,
        delete = false,
        source = "/var/git/",
        rsync = {
                binary = "/usr/bin/rsync",
                archive = true,
                perms = true,
                owner = true,
                _extra = {"-a"},
                update = true,
                protect_args = true,
                sparse = true,
                compress = true
                },
        ssh = {
                port = 2121,
                _extra = {"-i", "/root/.ssh/id_rsa","-o StrictHostKeyChecking=no"}
        },
        host = server,
        targetdir = "/var/git/";
}
end
