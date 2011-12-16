module: TLU

define constant <TLU-output>
  //= limited(<integer>, min: 0, max: 1);
  = <single-float>;
define constant <TLU-input-vector>
  = limited(<simple-object-vector>, of: <TLU-input>);
define constant $random-limit = 10;

define class <TLU-input> (<object>)
  slot value :: <single-float>,
    required-init-keyword: value:;
  
  slot weight :: <single-float>,
    init-keyword: weight:,
    init-value: as(<integer>, random($random-limit));
end class <TLU-input>;

define class <TLU> (<object>)
  slot input :: <TLU-input-vector>,
    required-init-keyword: input:;

  slot output :: <TLU-output>,
    init-keyword: output:;

  slot threshold :: <single-float>,
    init-keyword: threshold:,
    init-value: as(<integer>, random($random-limit));
end class <TLU>;

define method print-object (object :: <TLU>, stream :: <stream>)
 => ()
  for(i from 0 below object.input.size)
    format(stream, "%= ( %= )\n",
           object.input[i].value,
           object.input[i].weight);
  end for;
  format(stream, " -> %= ==> %=",
         object.output,
         object.threshold);
end;