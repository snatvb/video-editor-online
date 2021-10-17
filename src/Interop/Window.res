@val
external addEventListener: ([#resize | #click], unit => unit) => unit = "window.addEventListener"
@val
external removeEventListener: ([#resize | #click], unit => unit) => unit =
  "window.removeEventListener"
@val external setTimeout: (unit => unit, int) => int = "setTimeout"
@val external clearTimeout: int => unit = "clearTimeout"
@val external now: unit => int = "Date.now"

let on = (event, fn) => {
  addEventListener(event, fn)
  () => removeEventListener(event, fn)
}

let createTimeout = (fn, timeout) => {
  let timeoutId = setTimeout(fn, timeout)
  () => clearTimeout(timeoutId)
}
