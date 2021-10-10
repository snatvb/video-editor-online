module Button = {
  @react.component @module("antd")
  external make: (
    ~_type: [
      | #primary
      | #dashed
      | #text
      | #link
      | #default
    ]=?,
    ~style: ReactDOM.Style.t=?,
    ~children: React.element=?,
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
