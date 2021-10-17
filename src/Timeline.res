@module("./styles/Timeline.module.scss") external styles: {..} = "default"

type props
@obj external makeProps: unit => props = ""

let setPosition = (element, widthWrapper, positionPercent) => {
  element->DOM.Style.setTransformElement(
    `translateX(${(widthWrapper *. positionPercent)->Belt.Float.toInt->Belt.Int.toString}px)`,
  )
}

let make = React.memo(
  Mobx.observer((_: props) => {
    let baseRef = React.useRef(Js.Nullable.null)
    let timelineRef = React.useRef(Js.Nullable.null)
    let startRef = React.useRef(Js.Nullable.null)
    let cursorRef = React.useRef(Js.Nullable.null)
    let endRef = React.useRef(Js.Nullable.null)
    let (isDragging, setIsDragging) = React.useState(() => false)

    let state = Store.Timeline.store

    let updatePositions = React.useCallback0((startPosition, cursorPosition, endPosition) => {
      switch (
        timelineRef.current->Js.Nullable.toOption,
        startRef.current->Js.Nullable.toOption,
        cursorRef.current->Js.Nullable.toOption,
        endRef.current->Js.Nullable.toOption,
      ) {
      | (Some(timeline), Some(start), Some(cursor), Some(end)) => {
          let timelineWidth = DOM.Element.getClientWidth(timeline)
          setPosition(start, timelineWidth -. DOM.Element.getClientWidth(end), startPosition)
          setPosition(cursor, timelineWidth -. DOM.Element.getClientWidth(end), cursorPosition)
          setPosition(end, timelineWidth -. DOM.Element.getClientWidth(end), endPosition)
        }
      | _ => ()
      }
    })

    React.useEffect3(() => {
      updatePositions(state.start, state.currentTime, state.end)
      None
    }, (state.start, state.currentTime, state.end))

    React.useEffect0(() => {
      Some(Window.on(#resize, () => updatePositions(state.start, state.currentTime, state.end)))
    })

    let updateCurrentTime = Ruse.useThrottleFn(cursorX => {
      switch timelineRef.current->Js.Nullable.toOption {
      | Some(timeline) => {
        let bounding = DOM.Element.getBoundingClientRect(timeline)
        let x = cursorX->Belt.Int.toFloat -. bounding.x
        Store.Timeline.setForSetCurrentTime(x /. timeline->DOM.Element.getClientWidth)
      }
      | _ => ()
      }
    }, 50)

    React.useEffect1(() => {
      if isDragging {
        let offMouseMove = DOM.Document.on(#mousemove, event => {
          event->DOM.Document.getPageX->updateCurrentTime
        })

        let offMouseUp = DOM.Document.on(#mouseup, event => {
          event->DOM.Document.getPageX->updateCurrentTime
          setIsDragging(_ => false)
        })

        Some(
          () => {
            offMouseMove()
            offMouseUp()
          },
        )
      } else {
        None
      }
    }, [isDragging])

    let handleMouseDown = event => {
      event->ReactEvent.Mouse.pageX->updateCurrentTime
      setIsDragging(_ => true)
    }

    <div className={styles["base"]} ref={baseRef->ReactDOM.Ref.domRef}>
      <div
        className={styles["timeline"]}
        ref={timelineRef->ReactDOM.Ref.domRef}
        onMouseDown={handleMouseDown}>
        <div
          className={CX.cx([styles["bracket"], styles["start"]])}
          ref={startRef->ReactDOM.Ref.domRef}
        />
        <div className={styles["cursor"]} ref={cursorRef->ReactDOM.Ref.domRef}>
          <div className={styles["cursor-pin"]} />
        </div>
        <div
          className={CX.cx([styles["bracket"], styles["end"]])} ref={endRef->ReactDOM.Ref.domRef}
        />
      </div>
    </div>
  }),
)
