function ffpg --argument src_fmt dst_fmt src_path
  if ! set -q src_path
    set src_path .
  end

  for file in (find $src_path -name "*.$src_fmt")
    mkdir -p (dirname $file)"_$dst_fmt"

    echo "[$dst_fmt] <= $file"

	set dst_file (echo (basename $file) | sed -e 's/.flac$/.m4a/g')

    if [ $dst_fmt = 'm4a' ]
      ffmpeg -y -loglevel warning -i $file -map 0:a -c:a aac -b:a 257k (dirname $file)"_$dst_fmt/$dst_file"; or return
    else if [ $dst_fmt = 'mp3' ]
      ffmpeg -y -loglevel warning -i $file -q:a 0 -map_metadata 0 -id3v2_version 4 (dirname $file)"_$dst_fmt/"(basename $file); or return
    else
      echo unknown destination format
      return
    end
  end
end
