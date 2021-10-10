module Animated = {
  type t = {"div": React.component<ReactDOM.Props.domProps>}
  %%raw(`import { animated } from 'react-spring'`)

  module Div = {
    @obj
    external makeProps: (
      ~style: ReactDOM.Style.t=?,
      ~key: string=?,
      ~className: string=?,
      ~children: React.element,
      unit,
    ) => ReactDOM.Props.domProps = ""

    let make = %raw(`animated.div`)
  }
}

type config
@obj
external makeConfig: (~duration: int, unit) => config = ""

type options
@obj
external makeOptions: (
  ~from: ReactDOM.Style.t,
  ~enter: ReactDOM.Style.t,
  ~leave: ReactDOM.Style.t,
  ~delay: option<int>=?,
  ~config: option<config>=?,
  unit,
) => options = ""

type item
type mapItem = {
  item: item,
  props: ReactDOM.Style.t,
  key: string,
}

type transitions<'a, 'b> = @uncurry ((('a, 'b) => React.element) => React.element)

@module("react-spring")
external useTransition: ('t, options) => transitions<'a, 'b> = "useTransition"
