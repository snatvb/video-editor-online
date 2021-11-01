module Video = {
  @send external play: Dom.element => unit = "play"
  @send external pause: Dom.element => unit = "pause"
  @set external setCurrentTime: (Dom.element, float) => unit = "currentTime"
  @get external getCurrentTime: Dom.element => float = "currentTime"
  @get external getDuration: Dom.element => float = "duration"

  let stop = video => {
    video->pause
    video->setCurrentTime(0.0)
  }
}

module Element = {
  type bounds = {
    x: float,
    y: float,
    width: float,
    height: float,
    left: float,
    top: float,
  }
  @send external getBoundingClientRect: Dom.element => bounds = "getBoundingClientRect"
  @get external getClientWidth: Dom.element => float = "clientWidth"
  @set @scope("style") external setTranslate: Dom.element => string => unit = "transform"

  let setTranslateX = (element, x) => {
    element->setTranslate(`translateX(${x->Belt.Int.toString}px)`)
  }
}

module Style = {
  type t
  @get external get: Dom.element => t = "style"
  @set external setTransform: (t, string) => unit = "transform"
  let setTransformElement = (element, s) => element->get->setTransform(s)
}

module Document = {
  type t
  type eventType = [#mousemove | #mouseenter | #mouseleave | #mouseup]

  @val external document: t = "document"
  @send
  external addEventListener: (t, eventType, Dom.mouseEvent => unit) => unit = "addEventListener"
  @send
  external removeEventListener: (t, eventType, Dom.mouseEvent => unit) => unit =
    "removeEventListener"

  @get external getPageX: Dom.mouseEvent => int = "pageX"

  let on = (event, fn) => {
    addEventListener(document, event, fn)
    () => removeEventListener(document, event, fn)
  }
}

module ReactEventMouse = {
  @get external currentTarget: ReactEvent.Mouse.t => Dom.element = "currentTarget"
  @get external target: ReactEvent.Mouse.t => Dom.element = "target"
}
