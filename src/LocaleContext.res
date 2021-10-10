@module("./locales/en.json") external en: {..} = "default"
@module("./locales/ru.json") external ru: {..} = "default"

type locale = [#ru | #en]

let locales = {
  "ru": ru,
  "en": en,
}

let genTextsByLocale = (locale: locale): option<{..}> => {
  ignore(locale)
  Js.undefinedToOption(%raw(`locales[locale]`))
}

type readed
let unknownString: readed = %raw(`"UNKNOWN_STRING"`)
// let unknownString = "UNKNOWN_STRING"

external toFloat: readed => float = "%identity"
external toInt: readed => int = "%identity"
external toArray: readed => array<readed> = "%identity"
external toObject: readed => {..} = "%identity"
external toString: readed => string = "%identity"

let storageKey = "locale"

let read = (obj: {..}, path: array<string>): readed => {
  switch Helpers.path(Some(obj), path) {
  | Some(value) => value
  | None => unknownString
  }
}

let get = (locale: locale, path: array<string>) =>
  locale->genTextsByLocale->Belt.Option.mapWithDefault(unknownString, read(_, path))

let getAsReactStr = (locale, path) => locale->get(path)->toString->React.string

type context = {
  locale: locale,
  changeLocale: locale => unit,
}

let initialContext: context = {locale: #en, changeLocale: _ => ()}

let context = React.createContext(initialContext)

module Provider = {
  let systemLocale =
    %raw(`navigator.language || navigator.userLanguage`)
    ->Js.String2.split("-")
    ->Belt.Array.get(0)
    ->Belt.Option.getWithDefault("en")
    ->Js.String2.toLocaleLowerCase

  let readFromStorage = _ =>
    Dom_storage2.getItem(Dom.Storage2.localStorage, storageKey)
    ->Helpers.optionOr(systemLocale)
    ->Belt.Option.flatMap((str): option<locale> => {
      switch str {
      | "en" => Some(#en)
      | "ru" => Some(#ru)
      | _ => None
      }
    })
    ->Belt.Option.getWithDefault(#en)

  let provider = React.Context.provider(context)

  @react.component
  let make = (~children) => {
    let (locale, setLocale) = React.useState(readFromStorage)
    let changeLocale = loc => setLocale(_ => loc)
    React.useEffect1(() => {
      Dom.Storage2.setItem(Dom.Storage2.localStorage, storageKey, (locale :> string))
      None
    }, [locale])

    React.createElement(
      provider,
      {"value": {locale: locale, changeLocale: changeLocale}, "children": children},
    )
  }
}

let useLocaleContext = () => React.useContext(context)
let useLocale = () => React.useContext(context).locale
