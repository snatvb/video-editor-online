@module("./styles/Main.module.scss") external styles: {..} = "default"
open CX

type doc
@val external document: doc = "document"
@set external setTitle: (doc, string) => unit = "title"

let name = "Video Edit"

module Header = {
  @react.component
  let make = Mobx.observer(() => {
    let locale = LocaleContext.useLocale()

    <header className={styles["header"]}>
      <div />
      <div>
        {Store.Timeline.store.fileId->Belt.Option.isSome
          ? <RSuite.Button size={#xs} appearance={#primary} onClick={_ => Export.make()}>
              {locale->LocaleContext.getAsReactStr(["header", "export"])}
            </RSuite.Button>
          : React.null}
      </div>
    </header>
  })
}

@react.component
let make = () => {
  let url = Router.useUrl()
  Js.log(url.path->Belt.List.toArray)
  let transitions = RSpring.useTransition(
    url,
    RSpring.makeOptions(
      ~from=ReactDOM.Style.make(~opacity="0", ~transform="scale(1.1)", ()),
      ~enter=ReactDOM.Style.make(~opacity="1", ~transform="scale(1)", ()),
      ~leave=ReactDOM.Style.make(~opacity="0", ~transform="scale(0.9)", ()),
      ~config=Some(RSpring.makeConfig(~duration=200, ())),
      (),
    ),
  )

  React.useEffect1(() => {
    switch url.path {
    | list{"about"} => setTitle(document, `${name} — About`)
    | _ => setTitle(document, name)
    }

    None
  }, [url])

  <div className={styles["base"]}>
    <div className={styles["lang-selector"]}> <LanguageSelector /> </div>
    <Header />
    <main className={cx([styles["content"], Some("full-size")])}>
      <div className={styles["body"]}>
        {transitions((style, item) => {
          <RSpring.Animated.Div style className="page">
            {switch item["path"] {
            | list{} => <Project />
            | _ => React.string("Unknown page")
            }}
          </RSpring.Animated.Div>
        })}
      </div>
      <div className={styles["in-dev"]}> {React.string("Still development")} </div>
    </main>
  </div>
}
