@react.component
let make = (~path: string) => {
  React.useEffect1(() => {
    RescriptReactRouter.replace(path)
    None
  }, [path])
  React.null
}
