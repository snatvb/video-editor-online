let cx = arr => {
  let result = ref("")
  for i in 0 to arr->Js.Array2.length - 1 {
    switch arr->Js.Array2.unsafe_get(i) {
    | None => ()
    | Some("") => ()
    | Some(name) => result := (result.contents == "" ? name : result.contents ++ " " ++ name)
    }
  }
  result.contents
}
