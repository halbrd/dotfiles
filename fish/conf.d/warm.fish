function warm
  set -q argv[1]; or set argv[1] 4
  for i in (seq 1 $argv[1])
    yes > /dev/null &
  end
end

function unwarm
  killall yes
end
