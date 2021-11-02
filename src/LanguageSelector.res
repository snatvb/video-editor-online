@module("./styles/LanguageSelector.module.scss") external styles: {..} = "default"

@react.component
let make = React.memo(() => {
  let {locale, changeLocale} = LocaleContext.useLocaleContext()

  let transitions = RSpring.useTransition(
    locale,
    RSpring.makeOptions(
      ~from=ReactDOM.Style.make(~opacity="0", ~transform="scaleX(-1)", ()),
      ~enter=ReactDOM.Style.make(~opacity="1", ~transform="scaleX(1)", ()),
      ~leave=ReactDOM.Style.make(~opacity="0", ~transform="scaleX(-1)", ()),
      ~config=Some(RSpring.makeConfig(~duration=200, ())),
      (),
    ),
  )

  let onClick = _ => {
    switch locale {
    | #en => changeLocale(#ru)
    | #ru => changeLocale(#en)
    }
  }

  <div onClick className={styles["base"]}>
    {transitions((style, locale) => {
      <RSpring.Animated.Div style={style} className={styles["wrapper"]}>
        <button className={styles["button"]}>
          <div className={styles["current-lang"]}> {(locale :> string)->React.string} </div>
          <Icon.Translation className={styles["icon"]} />
        </button>
      </RSpring.Animated.Div>
    })}
  </div>
})
