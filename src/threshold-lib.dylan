module: dylan-user

define library threshold
  use common-dylan;
  use io;
end;

define module TLU
  export
    <TLU-input>,
    <TLU-output>,
    <TLU-input-vector>,
    <TLU>,
    value,
    value-setter,
    weight,
    weight-setter,
    input,
    input-setter,
    output,
    output-setter,
    threshold,
    threshold-setter,
    tlu;

  use common-dylan, exclude: { format-to-string };
  use format;
  use print;
  use simple-random;
end;

define module TLU-test
  use common-dylan;
  use format-out;
  use TLU;
end;
