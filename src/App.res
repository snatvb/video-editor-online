module Routes = {
  @react.component
  let make = () => {
    let url = Router.useUrl()

    switch url.path {
    | list{} | list{_} => <Main />
    | _ => <Redirect path="/" />
    }
  }
}

@react.component
let make = () => {
  <LocaleContext.Provider> <Routes /> <ExportProgress /> </LocaleContext.Provider>
}
