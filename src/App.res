@module("./logo.svg") external logo: string = "default"

module Routes = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()
    switch url.path {
    | list{} | list{_} => <Main />
    | _ => <Redirect path="/" />
    }
  }
}

@react.component
let make = () => {
  <LocaleContext.Provider>
    <Routes />
  </LocaleContext.Provider>
}
