# internet speed test
function netspeed
  curl -s https://gist.githubusercontent.com/halbrd/bafbeab36770134dc181237792af458e/raw/9a58ccd5de7374e9720b0f117b79bf2028e6a4a2/speedtest.py | python -
end

# disk speed tests
function diskspeed
  for path in $argv
    if test -e "$path/diskspeed"
      echo "ERROR: $path/diskspeed already exists"
    else
      sudo /sbin/sysctl -w vm.drop_caches=3 >/dev/null
      echo $path "write:" (sync; and dd if=/dev/zero of="$path/diskspeed" bs=1M count=1024 2>&1 >/dev/null; and sync) | cut -d " " -f 1,2,11-
      echo $path "read:" (sync; and dd if="$path/diskspeed" of=/dev/null bs=1M count=1024 2>&1 >/dev/null; and sync) | cut -d " " -f 1,2,11-
      rm "$path/diskspeed"
    end
  end
end
