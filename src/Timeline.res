@module("./styles/Timeline.module.scss") external styles: {..} = "default"

type props
@obj external makeProps: unit => props = ""

let setPosition = (element, widthWrapper, positionPercent) => {
  element->DOM.Style.setTransformElement(
    `translateX(${(widthWrapper *. positionPercent)->Belt.Float.toInt->Belt.Int.toString}px)`,
  )
}

type dragging =
  | None
  | StartBracket
  | Cursor
  | EndBracket

let make = React.memo(
  Mobx.observer((_: props) => {
    let baseRef = React.useRef(Js.Nullable.null)
    let timelineRef = React.useRef(Js.Nullable.null)
    let startRef = React.useRef(Js.Nullable.null)
    let cursorRef = React.useRef(Js.Nullable.null)
    let endRef = React.useRef(Js.Nullable.null)
    let (dragging, setDragging) = React.useState(() => None)

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

    React.useEffect0(() => {
      Window.onKeyDown(#BracketLeft, () => {
        Store.Timeline.setStart(state.currentTime)
      })->Some
    })

    let setCurrentTimeByArrow = time => {
      if DOM.Document.activeElement->DOM.Document.isVideo === false {
        Store.Timeline.setForSetCurrentTime(time)
      }
    }

    React.useEffect0(() => {
      Window.onKeyDown(#ArrowRight, () => {
        setCurrentTimeByArrow(state.currentTime +. 0.0016)
      })->Some
    })

    React.useEffect0(() => {
      Window.onKeyDown(#ArrowLeft, () => {
        setCurrentTimeByArrow(state.currentTime -. 0.0016)
      })->Some
    })

    React.useEffect0(() => {
      Window.onKeyDown(#BracketRight, () => {
        Store.Timeline.setEnd(state.currentTime)
      })->Some
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

    let updateBracketTime = Ruse.useThrottleFn(((cursorX, dragging)) => {
      switch timelineRef.current->Js.Nullable.toOption {
      | Some(timeline) => {
          let bounding = DOM.Element.getBoundingClientRect(timeline)
          let x = cursorX->Belt.Int.toFloat -. bounding.x
          let proportional = x /. timeline->DOM.Element.getClientWidth

          switch dragging {
          | StartBracket => Store.Timeline.setStart(proportional)
          | EndBracket => Store.Timeline.setEnd(proportional)
          | _ => ()
          }
        }
      | _ => ()
      }
    }, 50)

    let updateDragPosition = (cursorX, dragType) => {
      updateCurrentTime(cursorX)
      switch dragType {
      | StartBracket => updateBracketTime((cursorX, StartBracket))
      | EndBracket => updateBracketTime((cursorX, EndBracket))
      | _ => ()
      }
    }

    React.useEffect1(() => {
      if dragging !== None {
        let offMouseMove = DOM.Document.on(#mousemove, event => {
          updateDragPosition(event->DOM.Document.getPageX, dragging)
        })

        let offMouseUp = DOM.Document.on(#mouseup, event => {
          updateDragPosition(event->DOM.Document.getPageX, dragging)
          setDragging(_ => None)
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
    }, [dragging])

    let handleMouseDown = event => {
      switch (
        startRef.current->Js.Nullable.toOption,
        cursorRef.current->Js.Nullable.toOption,
        endRef.current->Js.Nullable.toOption,
      ) {
      | (Some(startElement), Some(_), Some(endElement)) =>
        let target = event->DOM.ReactEventMouse.target
        setDragging(_ =>
          if target === startElement {
            StartBracket
          } else if target === endElement {
            EndBracket
          } else {
            Cursor
          }
        )
      | _ => ()
      }
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
