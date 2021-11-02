module Key = {
  type t =
    | @as("[") BracketLeft
    | @as("]") BracketRight

  module Code = {
    type t = [
      | #BracketLeft
      | #BracketRight
      | #ArrowRight
      | #ArrowLeft
    ]
  }
}

module KeyCode = {
  type t =
    | @as(219) BracketLeft
    | @as(221) BracketRight
}

type keydownEvent = {key: Key.t, keyCode: KeyCode.t, code: Key.Code.t}

@val @scope("window")
external addEventListener: ([#resize | #click], unit => unit) => unit = "addEventListener"
@val @scope("window")
external removeEventListener: ([#resize | #click], unit => unit) => unit = "removeEventListener"
@val external setTimeout: (unit => unit, int) => int = "setTimeout"
@val external clearTimeout: int => unit = "clearTimeout"
@val external now: unit => int = "Date.now"
@val @scope("window")
external addEventListenerKeydown: (@as("keydown") _, keydownEvent => unit) => unit =
  "addEventListener"
@val @scope("window")
external cleanEventListener: (@as("keydown") _, keydownEvent => unit) => unit =
  "removeEventListener"

let on = (event, fn) => {
  addEventListener(event, fn)
  () => removeEventListener(event, fn)
}

let createTimeout = (fn, timeout) => {
  let timeoutId = setTimeout(fn, timeout)
  () => clearTimeout(timeoutId)
}

let onKeyDown = (key, fn) => {
  let callback = event => {
    if event.code === key {
      fn()
    }
  }

  addEventListenerKeydown(callback)
  () => cleanEventListener(callback)
}
