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

module Progress = {
  @react.component @module("antd")
  external make: (
    ~_type: [
      | #line
      | #circle
      | #dashboard
    ]=?,
    ~className: string=?,
    ~percent: float=?,
    ~width: float=?,
    ~showInfo: bool=?,
    ~steps: int=?,
    ~status: [
      | #success 
      | @as("exception") #except
      | #normal 
      | #active
    ]=?,
    ~trailColor: string=?,
    ~strokeColor: {..}=?,
    ~strokeLinecap: [
      | #round 
      | #square 
    ]=?,
  ) => React.element = "Progress"
}
