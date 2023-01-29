#!/usr/bin/env ruby
ARGV.length
cmd = ARGV[0]
pkgs = ARGV[1]
args = ARGV[2]
args2 = ARGV[3]
args3 = ARGV[4]
args4 = ARGV[5]
args5 = ARGV[6]
$version = 2.5

$config_file = '~/.utils/config.txt'
config = File.open(File.expand_path($config_file), 'r')
conf_data = config.readlines.map(&:chomp)
flatpakSupportEnabled = conf_data[1].to_s

if cmd == "-S"
    system "sudo apt install #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"
elsif cmd == "-Ss" || cmd == "-s"
    system "apt search #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-p" || cmd == "--print" 
    system "apt -s #{pkgs} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Rs"
    system "sudo apt remove #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Rn"
    system "sudo apt purge #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Syu" && flatpakSupportEnabled == "False"
    system "sudo apt update && sudo apt upgrade #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Syyu" && flatpakSupportEnabled == "False"
    system "sudo apt update && sudo apt dist-upgrade #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Syu" && flatpakSupportEnabled == "True"
    system "sudo apt update && sudo apt upgrade #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5} && flatpak update #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Syyu" && flatpakSupportEnabled == "True"
    system "sudo apt update && sudo apt dist-upgrade #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5} && flatpak update #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Sy"
    system "sudo apt update #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-D" && args == "--asexplicit"
    system "sudo apt-mark manual #{pkgs} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-S" && args == "--asdeps"
    system "sudo apt-mark auto #{pkgs} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Sc" || cmd == "-Scc"
    system "sudo apt autoclean #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Rcns"
    system "sudo apt autopurge #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-Qdtq" && pkgs == "n/a"
    system"apt list #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-I" || cmd =="-i" || cmd =="-Info" || cmd == "--info"
    system "apt show #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd =="-v"
    puts"POR Version #{$version.to_s}"

elsif cmd == "-h" || cmd == "--help" || cmd == "-H" || cmd == "--Help"
    system "less ~/.utils/help.txt"

elsif cmd.nil?
    system "sudo apt update && sudo apt upgrade"

elsif cmd == "test" && pkgs == "test"
  puts "test sucess"

elsif cmd == "-FA" && pkgs == "--enable" 
    system "echo 'FPS SET' > ~/.utils/config.txt"
    system "echo 'True' >> ~/.utils/config.txt"

elsif cmd == "-FA" && pkgs == "--disable"
    system "echo 'FPS SET' > ~/.utils/config.txt"
    system "echo 'False' >> ~/.utils/config.txt"

elsif cmd == "-FS"
    system "flatpak install #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd == "-FR"
    system "flatpak remove #{pkgs} #{args} #{args2} #{args3} #{args4} #{args5}"

elsif cmd =="-FL"
    system "flatpak list"

elsif cmd == "-FU"
    system "flatpak update #{pkgs} #{args}"

else
    puts "command not understood"
    puts "cmd = #{cmd}"
    puts "pkgs = #{pkgs}"
    puts "args = #{args}"
    puts "args2 = #{args2}"
    puts "args3 = #{args3}"
    puts "args4 = #{args4}"
    puts "args5 = #{args5}"

end
