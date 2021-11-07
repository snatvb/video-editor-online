let useUrl = () => {
  let url = RescriptReactRouter.useUrl()
  switch url.path {
  | list{"video", ...rest} => {...url, path: rest}
  | _ => url
  }
}
