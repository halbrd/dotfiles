set -x LIFX_LAMP_ID d073d512dc13
set -x LIFX_CEILSOUTH_ID d073d52052b4
set -x LIFX_CEILNORTH_ID d073d5233da8

function lifx-off
  lifx lan:transform $argv --silent -- '{"power":"off"}'
end

function lifx-on
  lifx lan:transform $argv --silent -- '{"power":"on"}'
end
