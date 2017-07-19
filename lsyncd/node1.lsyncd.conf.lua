settings {
        delay = 2,
        maxProcesses = 3,
        logfile = "/var/log/lsyncd.log",
        insist = true,
        nodaemon = true
}

targetlist = {
"root@node2"
}

for _, server in ipairs(targetlist) do
        sync {
        default.rsyncssh,
        delete = true,
        source = "/www/",
        rsync = {
                binary = "/usr/bin/rsync",
                archive = true,
                perms = true,
                owner = true,
                _extra = {"-a"},
                update = true,
                protect_args = true,
                sparse = true,
                ---temp_dir = "/opt/jmitty_test_tmp",
                compress = true
                },
        ssh = {
                port = 2121,
                _extra = {"-i", "/root/.ssh/id_rsa","-o StrictHostKeyChecking=no"}
        },
        host = server,
        targetdir = "/www/"
}
end
