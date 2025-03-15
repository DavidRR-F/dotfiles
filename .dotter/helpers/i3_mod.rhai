fn i3_mod(mod) {
  if (mod == "alt") {
    return "Mod1"
  } else {
    return "Mod4"
  }
}

let mod = params[0];

i3_mod(mod)
