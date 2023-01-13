#!/usr/bin/env ruby
ARGV.length
cmd = ARGV[0]
pkgs = ARGV[1]
args = ARGV[2]
args2 = ARGV[3]
args3 = ARGV[4]
args4 = ARGV[5]
args5 = ARGV[6]
if cmd == "-S"
    system "doas apt install #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"
elsif cmd == "-Ss" || cmd == "-s"
    system "apt search #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-p" || cmd == "--print" || args == "--print"
    system "apt -s #{pkgs} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Rs"
    system "doas apt remove #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Rn"
    system "doas apt purge #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Syu"
    system "doas apt update && doas apt upgrade #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Syyu"
    system "doas apt update && doas apt dist-upgrade #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Sy"
    system "doas apt update #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-D" && args == "--asexplicit"
    system "doas apt-mark manual #{pkgs} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-S" && args == "--asdeps"
    system "doas apt-mark auto #{pkgs} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Sc" || cmd == "-Scc"
    system "doas apt autoclean #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Rcns"
    system "doas apt autopurge #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Qdtq" && pkgs == "n/a"
    system"apt list #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-I" || cmd =="-i" || cmd =="-Info" || cmd == "--info"
    system "apt show #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-h" || cmd == "--help" || cmd == "-H" || cmd == "--Help"
    puts"============= Pacman Operational Rosetta v1 ============="
    puts"This utility was made to help pacman users migrate to apt"
    puts"========================================================="
    puts"\n"
    puts"usage: por [cmd] [pkgs] [arg] [arg2] [arg3] [arg4] [arg5]"
    puts"\n"
    puts"por -S [pkg]"
    puts"installs the [pkg]."
    puts"for multiple packages use 'pkg1 pkg2'"
    puts"\n"
    puts"por -Ss [pkg]"
    puts"searches for [pkg]"
    puts"\n"
    puts"por -p [pkg]"
    puts"or"
    puts"por -S [pkg] --print"
    puts"simulates the action." 
    puts"when using the argument form it must be the 1st argument"
    puts"\n"
    puts"por -Rs [pkg]"
    puts"removes the [pkg]."
    puts"does not remove user config files."
    puts"for multiple pkgs use 'pkg1 pkg2'"
    puts"\n"
    puts"por -Rn [pkg]"
    puts"removes the [pkg]."
    puts"does remove user config files."
    puts"for multiple pkgs use 'pkg1 pkg2'"
    puts"\n"
    puts"por -Syu"
    puts"updates all pkgs installed on system"
    puts"\n"
    puts"por -Syyu"
    puts"upgrades the system to next release if possible"
    puts"only recommended if on Debian or Ubuntu"
    puts"\n"
    puts"por -Sy"
    puts"updates local repo cache"
    puts"\n"
    puts"por -D [pkg] --asexplicit"
    puts"mark pkg as user installed"
    puts"for multiple pkgs use'pkg1 pkg2'"
    puts"\n"
    puts"por -S [pkg] --asdeps"
    puts"mark pkg as dependancys"
    puts"for multiple pkgs use 'pkg1 pkg2'"
    puts"\n"
    puts"por -Sc"
    puts"or"
    puts"por -Scc"
    puts"cleans un-needed pkgs from system"
    puts"does not remove user config files"
    puts"\n"
    puts"por -Rcns [pkg]"
    puts"cleans un-needed pkgs from system"
    puts"does remove user config files"
    puts"\n"
    puts"por -Qdtq"
    puts"list pkgs"
    puts"\n"
    puts"por -Qdtq n/a --installed"
    puts"list installed pkgs"
    puts"\n"
    puts"por -Qdtq n/a --upgradeable"
    puts"list upgradable pkgs"
    puts"\n"
    puts"por -Qdtq n/a --all-versions"
    puts"list all versions of a pkg"
    puts"\n"
    puts"por -i [pkg]"
    puts"or"
    puts"por -I [pkg]"
    puts"por --info [pkg]"
    puts"or"
    puts"por --Info [pkg]"
    puts"shows info about the pkg"



else
	system 'echo "command not understood"'
end
