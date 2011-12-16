module: TLU-test

define function main ()
 => ()
  let input = make(<TLU-input-vector>, size: 1);
  input[0] := make(<TLU-input>, value: 1.0, weight: 2.0);

  let static = tlu(input, 0.0, threshold: 1.5);
  let random = tlu(input, 0.0);
  
  //make(<TLU>, input: input, output: 0.0, threshold: 1.5);
  //let random = make(<TLU>, input: input, output: 0.0);
  
  format-out("%=\n", static);
  format-out("%=\n", random);
end;

main();
