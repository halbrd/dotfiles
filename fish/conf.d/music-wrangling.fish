function ffpg --argument src_fmt dst_fmt
  for file in (find . -name '*.$src_fmt')
    mkdir -p (dirname $file)'_$dst_fmt'

	if [ $dst_fmt = 'm4a' ]
      ffmpeg -i $file -map 0:a -c:a aac -b:a 257k (dirname $file)'_$dst_fmt/'(basename $file)
    else if [ $dst_fmt = 'mp3' ]
      echo this is not implemented yet
    end
  end
end
