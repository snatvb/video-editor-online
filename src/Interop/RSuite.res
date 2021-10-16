module Button = {
  @react.component @module("rsuite")
  external make: (
    ~_type: [
      | #submit
      | #button
      | #reset
    ]=?,
    ~style: ReactDOM.Style.t=?,
    ~children: React.element=?,
    ~classPrefix: string=?,
    ~className: string=?,
    ~active: bool=?,
    ~disabled: bool=?,
    ~loading: bool=?,
    ~block: bool=?,
    ~href: string=?,
    ~componentClass: 'a => React.element=?,
    ~appearance: [
      | #primary
      | #link
      | #subtle
      | #default
      | #ghost
    ]=?,
    ~color: [
      | #red
      | #orange
      | #yellow
      | #green
      | #cyan
      | #blue
      | #violet
    ]=?,
    ~size: [#lg | #md | #sm | #xs]=?,
    ~onClick: ReactEvent.Mouse.t => unit=?,
  ) => React.element = "Button"
}

module CustomProvider = {
  @react.component @module("rsuite")
  external make: (
    ~theme: [
      | #dark
      | #light
    ]=?,
    ~children: React.element=?,
  ) => React.element = "CustomProvider"
}