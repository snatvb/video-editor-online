open DOM.Video

@react.component
let make = React.memo((~file: File.t, ~className: option<string>=?) => {
  let ref = React.useRef(Js.Nullable.null)

  let handleMouseEnter = _ => {
    switch ref.current->Js.Nullable.toOption {
    | Some(video) => video->play
    | None => ()
    }
  }

  let handleMouseLeave = _ => {
    switch ref.current->Js.Nullable.toOption {
    | Some(video) => video->stop
    | None => ()
    }
  }

  <video
    ?className
    controls={false}
    muted={true}
    src={File.toSrc(file)}
    ref={ref->ReactDOM.Ref.domRef}
    onMouseEnter={handleMouseEnter}
    onMouseLeave={handleMouseLeave}
  />
})
