@module("react-use") @val external usePrevious: 't => option<'t> = "usePrevious"

// @module("react-use") @val external useThrottleFn: ('t, int) => 't = "useThrottleFn"

let useThrottleFn = (fn: 'a => 'b, ms) => {
  let timeoutRef = React.useRef(None)
  let lastUsedRef = React.useRef(0)

  React.useEffect0(() => Some(
    () => {
      timeoutRef.current->Belt.Option.map(Window.clearTimeout)->ignore
    },
  ))

  a => {
    let now = Window.now()
    let diff = now - lastUsedRef.current
    if diff > ms {
      fn(a)
      lastUsedRef.current = now
    } else if Belt.Option.isNone(timeoutRef.current) {
      lastUsedRef.current = now
      timeoutRef.current = Some(Window.setTimeout(() => {
          fn(a)
          timeoutRef.current = None
        }, ms))
    }
  }
}
